class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render :index
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render :show    
  end

  def create
    @recipe =Recipe.new(
      title: params[:title],
      ingredients: params[:ingredients],
      directions: params[:directions],
      user_id: params[:user_id]
    )
    if @recipe.save!
      render :show
    else
      render json: {errors: @recipe.erros.full_messages},
      status: unprocessable_entity
    end
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])

    @recipe.update(
    title: params[:title] || @recipe.title,
    ingredients: params[:ingredients] || @recipe.ingredients,
    directions: params[:directions] || @recipe.directions,
    user_id: params[:user_id] || @recipe.user_id
    )
    @recipe.save!
    render :show
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "recipe has been removed"}
  end


end