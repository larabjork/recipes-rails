class RecipesController < ApplicationController

  def index
    if params[:format]
      @recipes = Recipe.alphabetize
    else
      @recipes = Recipe.all
    end
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:notice] = "Recipe successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def update
    @recipe= Recipe.find(params[:id])
    if params[:ingredient_ids]
      ingredients = params[:ingredient_ids].map { |id| Ingredient.find(id.to_i)}
      @recipe.ingredients.each do |ingredient|
        if ingredients.exclude?(ingredient)
          @recipe.ingredients.delete(ingredient)
        end
      end
      ingredients.each do |ingredient|
        if @recipe.ingredients.exclude?(ingredient)
          @recipe.ingredients << ingredient
        end
      end
    end
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  # def alphabetize
  #   @recipes = Recipes.all
  #   self. { |a, b| a.name.downcase <=> b.name.downcase }


  private
  def recipe_params
    params.require(:recipe).permit(:name, :img, :directions)
  end

end
