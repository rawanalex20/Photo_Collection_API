class PhotosController < ApplicationController
  before_action :set_photo, only: %i[ show update destroy ]

  # GET venues/:venue_id/photos / users/:user_id/photos 
  def index
    @photos = []
    if (params[:venue_id]==nil)
      @photos = Photo.find_by(venue_id: params[:user_id])
    else
      @photos = Photo.find_by(user_id: params[:venue_id])
    end

    render json: @photos
  end

  # GET venues/:venue_id/photos/1 / users/:user_id/photos/1 
  def show
    @photo= nil
    if (params[:venue_id]==nil)
      @photo = Photo.find_by(venue_id: params[:user_id])
    else
      @photo = Photo.find_by(user_id: params[:venue_id])
    end

    render json: @photo
  end

  # POST venues/:venue_id/photos / users/:user_id/photos 
  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT venues/:venue_id/photos/1 / users/:user_id/photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE venues/:venue_id/photos/1 / users/:user_id/photos/1
  def destroy
    @photo.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.fetch(:photo, {}, :venue_id, :user_id)
    end
end
