class AddBeverageToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :beverage, :string
  end
end
