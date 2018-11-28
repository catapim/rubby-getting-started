class Widget < ActiveRecord::Base
  include AASM

  has_many :transactions, foreign_key: 'widget_id', class_name: 'WidgetTransaction'

  aasm do
    state :empty, initial: true
    state :verifying_stock
    state :low_stock
    state :in_stock
    state :over_stocked
    state :removed
    state :broken_stock

    event :arrival do
      transitions from: %i[empty verifying_stock low_stock in_stock over_stocked],
                  to: :verifying_stock,
                  success: :verify_stock

      transitions from: :broken_stock,
                  to: :verifying_stock,
                  success: %i[verify_stock notify_arrival_to_customers]
    end

    event :sell do
      transitions from: %i[in_stock over_stocked], to: :in_stock, guards: %i[available_stock? still_in_stock?]
      transitions from: %i[in_stock over_stocked], to: :low_stock, guards: %i[available_stock? still_in_low_stock?], success: :notify_low_stock
      transitions from: %i[in_stock low_stock over_stocked], to: :broken_stock, success: %i[notify_broken_stock request_more_product]
    end

    event :remove do
      transitions from: %i[low_stock broken_stock empty], to: :removed
    end
  end

  def verify_stock
    VerifyProductStockJob.perform_later(self)
  end

  def notify_arrival_to_customers
    NotifyArrivalToCustomersJob.perform_later(self)
  end

  def notify_low_stock
    NotifyLowStockJob.perform_later(self)
  end

  def notify_broken_stock
    NotifyBrokenStockJob.perform_later(self)
  end

  def request_more_product
    RequestMoreProductJob.perform_later(self)
  end
end
