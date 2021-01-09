class RenameFoodInMealsToProtein < ActiveRecord::Migration[6.0]
  def change
    rename_column :meals, :food, :protein
  end
end
