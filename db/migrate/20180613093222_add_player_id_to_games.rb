class AddPlayerIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :player_id, :integer
  end
end
