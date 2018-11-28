class WidgetTransaction < ApplicationRecord
  belongs_to :widget
  belongs_to :incumbent, polymorphic: true

  scope :historical, -> { order(created_at: :desc) }
end
