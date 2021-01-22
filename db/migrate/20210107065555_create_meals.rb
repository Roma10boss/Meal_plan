class CreateMeals < ActiveRecord::Migration[6.0]
  def change
    create_table :meals do |t|
      t.string :food
      t.datetime :day
      t.references :meal_plan, foreign_key: true
      t.timestamps
      t.integer :beverage_ounces
      t.string :side
      t.string :vegetable
      t.string :beverage
      t.integer :drink
      t.boolean :favorite, default: false
      
    end
  end
end
