require 'debugger'

class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  before_filter :get_album
  
  # GET /photos
  # GET /photos.json
  def index
    @photos = @album.photos
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
   @photo = @album.photos.find(params[:id])  
  end

  # GET /photos/new
  def new
    @photo = Photo.new(album_id: @album.id)
  end

  # GET /photos/1/edit
  def edit
    @photo = @album.photos.find(params[:id])  
  end

  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    respond_to do |format|
      if @photo.save
        format.html { redirect_to album_photos_url(@album), notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def photo_file
    @photo = Photo.new(photo_params)
    @photo.photo_path
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to album_photos_url(@album), notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    logger.debug("deleting #{@photo.photo_filename}")
    @photo.delete_photo 
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to album_photos_url(@album) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :timestamp, :photo_file, :description, :album_id)
    end

    # converts the album_id from routing to an @album object to use in the view
    def get_album
      @album = Album.find(params[:album_id])
    end
end
