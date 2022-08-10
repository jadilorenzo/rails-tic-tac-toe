class Game < ApplicationRecord
  validates :player2_id, comparison: {other_than: :player1_id}
  validates :player1_id, comparison: {other_than: :player2_id}
  validates :name, presence: true
  validates :turn_id, presence: true
end
