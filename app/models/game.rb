# frozen_string_literal: true

class Game < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5, maximum: 500 }
  belongs_to :player
  validates :player_id, presence: true
end
