class AddEndToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :end, :datetime
  end
end
