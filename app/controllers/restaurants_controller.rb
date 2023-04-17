class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update]
  before_action :authenticate_user!, except: [:index, :show, :search]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    #params[:will_split][:will_not_split] = 0 if params[:will_split][:will_not_split].blank?
    @restaurant = Restaurant.new(restaurant_params)
    # @restaurant.will_split = 0
    # @restaurant.will_not_split = 0

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1
  # PATCH/PUT /restaurants/1.json
  def update
    #params[:will_split][:will_not_split] = 0 if params[:will_split][:will_not_split].blank?
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def search
    @restaurants = Restaurant.search(name: params[:query_name], location: params[:query_location])

    respond_to do |format|
      format.html { render :index }
      format.json { render :index, status: :ok }
    end
  end

  # def vote_will_split
  #   respond_to do |format|
  #     if Restaurant.update(@restaurant[:id],:will_split => @restaurant[:will_split] + 1)
  #       format.html { redirect_to restaurants_url, notice: "Thank you for voting that the restuarant is splitting the bills!" }
  #       format.json { render :index, status: :ok, location: @restaurant }
  #     else
  #       format.html { redirect_to restaurants_url, status: :unprocessable_entity, notice: "Something went wrong..." }
  #       format.json { render :index, json: @restaurant.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # def vote_will_not_split
  #   respond_to do |format|
  #     if Restaurant.update(@restaurant[:id],:will_not_split => @restaurant[:will_not_split] + 1)
  #       format.html { redirect_to restaurants_url, notice: "Thank you for voting that the restuarant is not splitting the bills!" }
  #       format.json { render :index, status: :ok, location: @restaurant }
  #     else
  #       format.html { redirect_to restaurants_url, status: :unprocessable_entity, notice: "Something went wrong..." }
  #       format.json { render :index, json: @restaurant.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location)
    end
end
