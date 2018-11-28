class CreateWidgetTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :widget_transactions do |t|
      t.references :widget, foreign_key: true
      t.string :operation
      t.integer :amount
      t.string :incumbent_type
      t.integer :incumbent_id

      t.timestamps
    end
  end

  def data
    (1..3000).each do |i|
      operation = (i % 17).zero? ? 'restock' : 'sell'
      offset = rand(Widget.count)
      widget = Widget.offset(offset).first

      incumbent = if operation == 'restock'
                    Operator.offset(rand(Operator.count)).first
                  else
                    Client.offset(rand(Client.count)).first
                  end
      amount = operation == 'restock' ? rand(100..500) : rand(3..25)

      WidgetTransaction.create operation: operation, widget: widget, incumbent: incumbent, amount: amount, created_at: (5000 - i).minutes.ago
    end
  end
end
