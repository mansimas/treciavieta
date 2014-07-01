class CreateBankets < ActiveRecord::Migration
  def change
    create_table :bankets do |t|
      t.datetime :arrival
      t.datetime :departure
      t.integer :places
      t.integer :price
      t.references :post, index: true

      t.timestamps
    end
  end
end
