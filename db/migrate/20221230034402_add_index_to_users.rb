class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    #add_column :users, :email, :string
    add_index :users, :email, unique: true
  end
end
