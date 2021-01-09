class MealSchedule < ApplicationRecord
    belongs_to :meal
    belongs_to :meal_plan
  
    validates :eating_time, :meal_type, presence: true
    default_scope -> { order(updated_at: :desc)}
  
    accepts_nested_attributes_for :meal, reject_if: :all_blank
  
  
    def meal=(attributes)
      self.build_meal(attributes) unless self.meal_id
    end
  end