class CocktailsController < ApplicationController



  def self.search(search)
    if search
      cocktail = Cocktail.find.by(name: search)
      if cocktail
        self.where(cocktail_id: cocktail)
      else
        Cocktail.all
      end
    else
      Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktails_path
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def index
    @cocktails = Cocktail.all
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
