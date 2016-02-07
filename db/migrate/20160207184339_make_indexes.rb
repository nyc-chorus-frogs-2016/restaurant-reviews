class MakeIndexes < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
    add_index :restaurants, :creator_id
    add_index :reviews, :reviewer_id
    add_index :reviews, :restaurant_id
  end
end
