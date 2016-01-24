class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.decimal :distance, :precision => 10, :scale => 4
      t.decimal :elevation_gain, :precision => 10, :scale => 4
      t.timestamps null: false
    end
  end
end
