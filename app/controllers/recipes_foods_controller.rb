class RecipesFoodsController < ApplicationController

  def index
    @foods = current_user.recipes_foods
    @sum = 0
    @foods.each do |food|
      @sum += food.quantity * food.food.price
    end
  end

  def create
    @recipes_foods = RecipesFood.new(recipes_foods_params)

    respond_to do |format|
      if @recipes_foods.save
        format.html { redirect_to recipe_url(@recipes_foods.recipe), notice: 'Ingredient was successfully saved.' }
        format.json { render :show, status: :created, location: @recipes_foods.recipe }
      else
        format.html { redirect_to recipe_url(recipes_foods_params[:recipe_id]), notice: 'Ingredient was not successfully saved.' }
        format.json { render json: @recipes_foods.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
  end

  def destroy
    RecipesFood.destroy(params[:id])
    redirect_to recipe_path(recipes_foods_params[:recipe_id])
  end

  # Only allow a list of trusted parameters through.
  def recipes_foods_params
    params.require(:recipe_food).permit(:food_id, :quantity, :recipe_id)
  end
end
