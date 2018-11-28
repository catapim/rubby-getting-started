class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end

  NAMES = %w[John Phil Sam Andrew Mary Victoria Francis Cecil Laura Tony Gretel Peter Matthew Alisha Chris Theodora Analice Rachel Michaela Sabrina Vivian].freeze
  SURNAMES = %w[Smith Connor Benitez Franken Duetto ODonell Dominic].freeze
  def data
    (1..100).each do |i|
      Client.create name: "#{NAMES.sample} #{SURNAMES.sample}", email: "client#{i}@example.com"
    end
  end
end
