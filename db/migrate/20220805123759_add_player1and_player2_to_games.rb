class AddPlayer1andPlayer2ToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :player1, foreign_key: { to_table: :users }
    add_reference :games, :player2, foreign_key: { to_table: :users }
    add_reference :games, :turn, foreign_key: { to_table: :users }
  end
end
