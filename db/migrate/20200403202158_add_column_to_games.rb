class AddColumnToGames < ActiveRecord::Migration
  def change
    add_column :games, :notes, :string
  end
end
