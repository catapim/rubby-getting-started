class Operator < ApplicationRecord
  has_many :widget_transactions, as: :incumbent
  def ranking
    tx_count = widget_transactions.count
    position = WidgetTransaction.where(incumbent_type: self.class.name)
                                .group(:incumbent_id)
                                .count
                                .values
                                .sort
                                .reverse
                                .find_index(tx_count)
  end
end
