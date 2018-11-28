class CreateWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :widgets do |t|
      t.string :name
      t.text :description
      t.string :sku
      t.integer :stock

      t.timestamps
    end
  end

  WORDS = %w[Theming the navbar has never been easier thanks to the combination of theming classes and utilities. Choose from for use with light background colors customize Use Bootstrap’s custom button styles for actions in forms dialogs and more with support for multiple sizes states and more. Bootstrap includes several predefined button styles each serving its own semantic purpose with a few extras thrown in for more control. Using color to add meaning only provides a visual indication which will not be conveyed to users of assistive technologies].freeze

  def data
    (1010..1450).each_with_index do |i, ix|
      sku = "#{(i * 6271).to_s(26)}-#{i.to_s.rjust(4, '0')}".upcase
      desc = WORDS.sample(100).join(' ')
      Widget.create sku: sku, name: "Product #{ix}", description: desc, stock: (1300 - i).abs
    end
  end
end
