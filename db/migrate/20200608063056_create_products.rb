class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user
      t.references :category
      t.string :name
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
