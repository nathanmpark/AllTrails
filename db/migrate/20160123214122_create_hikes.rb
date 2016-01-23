class CreateHikes < ActiveRecord::Migration
  def change
    create_table :hikes do |t|
      t.references :user
      t.references :trail
      t.integer :calories_burned
      t.timestamps null: false
    end
  end
end
