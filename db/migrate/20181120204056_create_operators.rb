class CreateOperators < ActiveRecord::Migration[5.1]
  def change
    create_table :operators do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  NAMES = %w[John Phil Sam Andrew Mary Victoria Francis Cecil Laura Tony Gretel].freeze
  SURNAMES = %w[Smith Connor Benitez Franken Duetto ODonell Dominic].freeze
  def data

    (1..10).each do |i|
      Operator.create name: "#{NAMES.sample} #{SURNAMES.sample}", email: "operator#{i}@example.com"
    end
  end
end
