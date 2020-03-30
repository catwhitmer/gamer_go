class CreateUsersTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name 
      t.text :email 
      t.text :password_digest
    end
  end
end
