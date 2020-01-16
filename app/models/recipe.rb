class Recipe < ApplicationRecord
  has_and_belongs_to_many(:ingredients)
  validates :name, presence: true
  validates :directions, presence: true
  before_save(:titleize_recipe)

  private
    def titleize_recipe
      self.name = self.name.titleize
    end
end
