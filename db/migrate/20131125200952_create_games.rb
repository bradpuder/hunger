class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :number, null: false
    end
  end
end
