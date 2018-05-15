# frozen_string_literal: true

class AddGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
