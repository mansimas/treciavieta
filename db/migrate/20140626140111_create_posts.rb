class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :category
      t.date :begin
      t.date :end
      t.integer :adult
      t.integer :children

      t.timestamps
    end
  end
end
