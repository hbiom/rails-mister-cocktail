class CocktailsController < ApplicationController

  def new
    @Cocktail = Cocktail.new
  end

  def create
    @Cocktail = Cocktail.new(cocktail_params)
    @Cocktail.save
    redirect_to Cocktails_path
  end

  def edit
    @Cocktail = Cocktail.find(params[:id])
  end

  def update
    @Cocktail = Cocktail.find(params[:id])
    @Cocktail.update(cocktail_params)
  end

  def show
    @Cocktail = Cocktail.find(params[:id])
  end

  def index
    @Cocktails = Cocktail.all
  end

  def delete
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
