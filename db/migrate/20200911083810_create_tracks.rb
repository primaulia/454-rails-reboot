class CreateTracks < ActiveRecord::Migration[6.0]
  def change
    create_table :tracks do |t|
      t.references :album, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true
      t.string :name
      t.string :composer
      t.integer :milliseconds
      t.integer :bytes
      t.decimal :unit_price

      t.timestamps
    end
  end
end
