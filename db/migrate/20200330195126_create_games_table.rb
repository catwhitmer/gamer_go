class CreateGamesTable < ActiveRecord::Migration
  def change
    create_table :games do |t| 
      t.string :name 
      t.string :genre 
      t.text :user_id
    end
  end
end
