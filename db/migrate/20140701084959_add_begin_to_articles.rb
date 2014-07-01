class AddBeginToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :arrival, :datetime
    add_column :articles, :departure, :datetime
    add_column :articles, :people, :integer
  end
end
