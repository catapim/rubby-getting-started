class Operator < ApplicationRecord
  has_many :widget_transactions, as: :incumbent
  def ranking

  end
end
