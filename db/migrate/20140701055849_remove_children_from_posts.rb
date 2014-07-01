class RemoveChildrenFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :children, :integer
    remove_column :posts, :begin, :date
    remove_column :posts, :end, :date
    remove_column :posts, :adult, :integer
  end
end
