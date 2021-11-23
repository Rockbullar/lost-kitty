class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def create
    pet = Pet.new(pet_params)
    pet.save
    redirect_to pet_path(pet)
  end

  def new
    @new_pet = Pet.new
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
	  if @pet.update(pet_params)
		  redirect_to pet_path(@pet)
	  end
  end

  def destroy
    pet = Pet.find(params[:id])
	  if pet.destroy
		  redirect_to pets_path
	  end
  end

  private

  def pet_params
    params.require(:pet).permit(:img, :name, :breed)
  end

end
