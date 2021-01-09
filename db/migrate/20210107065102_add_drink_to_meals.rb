class AddDrinkToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :drink, :integer
  end
end
