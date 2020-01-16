class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column(:recipes, :cuisine)
    remove_column(:recipes, :servings)
    remove_column(:recipes, :course)
  end
end
