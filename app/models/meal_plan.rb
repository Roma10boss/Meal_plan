class MealPlan < ApplicationRecord
    belongs_to :user
    has_many :meal_schedules, dependent: :destroy
    has_many :meals, through: :meal_schedules, dependent: :destroy
  
    validates :goal, :description, presence: true
    default_scope -> { order(updated_at: :desc)}
  
  end