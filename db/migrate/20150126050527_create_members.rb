class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.string :password
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
