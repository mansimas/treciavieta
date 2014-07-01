class AddFood1ToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :food1, :string
    add_column :articles, :food2, :string
  end
end
