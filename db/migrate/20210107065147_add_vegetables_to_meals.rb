class AddVegetablesToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :vegetable, :string
  end
end
