class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
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

  def add
    @recipe = Recipe.find(params[:id])
    ingredient = Ingredient.where(name params[:ingredient].fetch("ingredient")).first
    @recipe.ingredients << ingredient
    redirect_to recipes_path
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :cuisine, :course, :servings, :directions)
  end

end
