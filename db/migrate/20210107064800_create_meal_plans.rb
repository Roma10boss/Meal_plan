class CreateMealPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :meal_plans do |t|
      t.string :goal
      t.string :type
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
