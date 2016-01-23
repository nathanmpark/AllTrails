class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.decimal :length, :precision => 10, :scale => 2
      t.decimal :elevation_gain, :precision => 10, :scale => 2
      t.timestamps null: false
    end
  end
end
