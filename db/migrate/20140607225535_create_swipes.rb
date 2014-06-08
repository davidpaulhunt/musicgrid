class CreateSwipes < ActiveRecord::Migration
  def change
    create_table :swipes do |t|
      t.integer :user_id
      t.integer :album_id
      t.integer :preference_id

      t.timestamps
    end
  end
end
