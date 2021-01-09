class Meal < ApplicationRecord
    has_many :meal_schedules 
    has_many :meal_plans, through: :meal_schedules

    validates :protein, :vegetable, :side, :day, :beverage, :beverage_ounces, presence: true
    validates_inclusion_of :favorite, in: [true, false]

    scope :favorite, -> { where(favorite: true) unless Meal.all.empty? }
    default_scope -> { order(updated_at: :desc)}

end 