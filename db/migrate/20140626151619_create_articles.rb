class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :food
      t.string :delivery
      t.string :tradition
      t.references :post, index: true

      t.timestamps
    end
  end
end
