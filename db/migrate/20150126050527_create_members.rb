class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, presence: true, uniqueness: true
      t.string :password, presence: true
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
