class AddBeginToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :begin, :datetime
    add_column :posts, :people, :integer
  end
end
