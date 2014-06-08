class AddTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :native_access_token, :string
  end
end
