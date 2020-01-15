class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.column(:name, :string)
      t.column(:cuisine, :string)
      t.column(:course, :string)
      t.column(:servings, :integer)
      t.column(:directions, :string)

      t.timestamps
    end
  end
end
