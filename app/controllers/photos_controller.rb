class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # GET /photos/1/albums
  def albums
    @photo = Photo.find(params[:id])
    @albums = @photo.albums
  end

  # POST /photos/1/album_add?album_id=2 --note: no real query string, just convenient notation for params
  def album_add
    
    #convert ids from routing to objects
    @photo = Photo.find(params[:id])
    @album = Photo.find(params[:album])

    if not @photo.in_album?(@album)
      #add photo to album list
      @photo.albums << @album
      flash[:notice] = 'Photo was successfully added to the album'
    else
      flash[:notice] = 'Photo was already in the album' 
    end
    redirect_to :action => :albums, :id => @photo
  end

  # POST /photos/1/album_remove?albums[]=
  def album_remove

    #converts ids from routing to object
    @photo = Photo.find(params[:id])

    #get list of albums to remove from query string
    album_ids = params[:albums]

    unless album_ids.blank?
      album_ids.each do |album_id|
        album = Album.find(album_id)
        if @photo.in_album?(album)
          logger.info "Removing photo from album #{album.id}"
#ADD THIS BACK IN FOR DELETE! - causing error
          #@photo.albums.delete(album)
          #flash[:notice] = 'Album was successfully deleted'
        end
      end
    end
    redirect_to :action => :albums, :id => @photo
  end


  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
# on create, check if photo exists, and if does, throw warning...

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
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
      format.html { redirect_to photos_url }
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
      #params.require(:photo).permit(:title, :timestamp, :extension, :description)
      params.permit(:title, :timestamp, :extension, :description)
    end
end
