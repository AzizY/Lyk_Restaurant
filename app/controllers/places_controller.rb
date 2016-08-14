class PlacesController < ApplicationController
  def index
    @Places = Place.all
  end

  def show
    set_place
  end

  def new
    @place = Place.new
    load_categories
  end

  def create
    @place = Place.create(place_params)

    if @place.save
      redirect_to place_path(@place)
    else
      load_categories
      render :new
    end
  end

  def edit
    set_place
    load_categories
  end

  def update
    if @place.update(place_params)
      redirect_to place_path(@place)
    else
      load_categories
      render :edit
    end
  end

  def destroy
    set_place
    @place.destroy
    redirect_to places_path

  end
  private
  def load_categories
    @categories = Category.all.collect {|c| [c.name, c.id ] }
  end

  def set_place
    @place = Place.find(params[:id])
  end
  def place_params
    params.require(:place).permit(:name, :address, :city, :phone_number,:contact_mail, :description, :category_id)
  end
end
