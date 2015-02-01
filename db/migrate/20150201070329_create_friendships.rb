class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :member_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
