class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :weight
      t.decimal :pace, :precision => 3, :scale => 1
      t.timestamps null: false
    end
  end
end
