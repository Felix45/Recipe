class FoodsController < ApplicationController
  def index
    @foods = current_user.foods.order('id DESC')
  end

  def new
    newfood = Food.new
    respond_to do |format|
      format.html { render :new, locals: { newfood: } }
    end
  end

  def create
    @food = current_user.foods.new(food_params)
    respond_to do |format|
      format.html do
        if @food.save
          redirect_to foods_path
        else
          newfood = Food.new
          render :new, locals: { newfood: }
        end
      end
    end
  end

  def destroy
    Food.destroy(params[:id])
    redirect_to foods_path
  end

  private
  
  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
