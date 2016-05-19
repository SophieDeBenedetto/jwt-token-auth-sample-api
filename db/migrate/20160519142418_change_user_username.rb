class ChangeUserUsername < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :username
    add_column :users, :email, :string
  end
end
