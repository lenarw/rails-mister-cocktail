class DosesController < ApplicationController

  before_action :set_cocktail, only: [:index, :new, :create]
  before_action :set_dose, only: :destroy

  def index
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = @cocktail.doses.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    cocktail_id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(cocktail_id)
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
    # pas oblige de mettre cocktail_id
  end

end
