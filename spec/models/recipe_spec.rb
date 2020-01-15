require 'rails_helper'

describe Recipe do
  it { should have_and_belong_to_many :ingredients }
  it { should validate_presence_of :name}
  it { should validate_presence_of :cuisine}
  it { should validate_presence_of :course}
  it { should validate_presence_of :servings}
  it { should validate_presence_of :directions}
  it("titleizes the name of an recipe") do
    recipe = Recipe.create({name: "giant steps", cuisine: "itialian", course: "appetizer", servings: 3, directions: "blah blah"})
    expect(recipe.name()).to(eq("Giant Steps"))
  end
end
