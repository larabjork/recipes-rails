class Recipe < ApplicationRecord
  has_and_belongs_to_many(:ingredients)
  validates :name, presence: true
  validates :cuisine, presence: true
  validates :course, presence: true
  validates :servings, presence: true
  validates :directions, presence: true
  validates :servings, numericality: { less_than_or_equal_to: 10}
  validates :servings, numericality: { greater_than_or_equal_to: 1}
  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.name = self.name.titleize
      self.cuisine = self.cuisine.titleize
      self.course = self.course.titleize
    end
end
