class DosesController < ApplicationController
  before_action :set_doses, only: [:show]
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save # return true
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def set_doses
    @doses = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end
end
