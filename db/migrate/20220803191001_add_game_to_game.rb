class AddGameToGame < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :game, :string
  end
end
