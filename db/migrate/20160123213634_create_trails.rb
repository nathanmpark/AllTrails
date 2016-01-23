class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.string :name
      t.decimal :distance, :precision => 7, :scale => 1
      t.timestamps null: false
    end
  end
end
