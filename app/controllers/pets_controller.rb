class PetsController < ApplicationController
  def index
    @pets = Pet.all
    render :index
  end

  def show
    @pet = Pet.find_by(id: params[:id])
    render :show
  end

  def new
    @pets = Pet.new
    render :new
  end

  def create
    @pet = Pet.create(
      name: params[:pet][:name],
      breed: params[:pet][:breed],
      image: params[:pet][:image],
    )
    redirect_to "/pets"
  end

  def edit
    @pets = Pet.find_by(id: params[:id])
    render :edit
  end

  def update
    @pet = Pet.find_by(id: params[:id])
    @pet.update(
      name: params[:photo][:name],
      breed: params[:photo][:breed],
      image: params[:photo][:image]
    )
    redirect_to "/pets"
  end

  def destroy
    @pet = Pet.find_by(id: params[:id])
    @pet.destroy
    redirect_to "/pets", status: :see_other
  end
end
