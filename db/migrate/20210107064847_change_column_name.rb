class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :meal_plans, :type, :description
  end
end
