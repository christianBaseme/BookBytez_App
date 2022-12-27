class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :course
      t.string :email
      t.string :major
      t.string :role
      t.integer :followers
      t.integer :following
      t.string :password_digest

      t.timestamps
    end
  end
end
