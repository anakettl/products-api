class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :lm
      t.string :name
      t.boolean :free_shipping
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
