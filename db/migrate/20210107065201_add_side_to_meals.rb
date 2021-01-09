class AddSideToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :side, :string
    
  end
end
