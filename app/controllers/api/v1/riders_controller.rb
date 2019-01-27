class Api::V1::RidersController < ApplicationController
  before_action :set_rider, only: [:show, :update, :destroy]

  # GET /riders
  def index
    @riders = Rider.all

    render json: @riders
  end

  # GET /riders/1
  def show
    render json: @rider
  end

  # POST /riders
  def create
    @rider = Rider.new(rider_params)

    if @rider.save
      render json: @rider, status: :created, location: api_v1_rider_url(@rider)
    else
      render json: @rider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /riders/1
  def update
    if @rider.update(rider_params)
      render json: @rider
    else
      render json: @rider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /riders/1
  def destroy
    @rider.destroy
    msg = {id: params[:id], message: "Deleted"}
    render json: msg, status: 204
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rider
      @rider = Rider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def rider_params
      params.require(:rider).permit(:first_name, :last_name, :image, :city, :state, :latitude, :longitude)
    end
end
