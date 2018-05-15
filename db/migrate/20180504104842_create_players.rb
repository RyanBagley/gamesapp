# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :playername
      t.string :email
      t.timestamps
    end
  end
end
