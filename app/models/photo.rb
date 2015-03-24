class Photo < ActiveRecord::Base

  #validates_presence_of :title #add other mandatory attrs here...
  after_save :store_photo
  belongs_to :albums

  def photo_file=(file_data)
    unless file_data.blank?
      #store uploaded data in a private instance var
      @file_data = file_data
      #set title to be unique file name
      logger.debug("setting the title...")
      self.title = file_data.original_filename.split('.').first.downcase
      logger.debug("self.title is... #{self.title}")
    end
  end

  PHOTO_STORE = File.join(Rails.root, 'public', 'photo_store')

# write image file here
  def photo_filename
    File.join(PHOTO_STORE, "/#{title}")
  end
 
  #def make_file
   # File.open("/Users/graceschuurmans/firstSite/myapp/public/test.txt", "w") { |f| f.write("I did it!") }
  #end

# return a path to photo to use in the view
  def photo_path
    "/photo_store/#{title}"
  end

  def delete_photo
    if File.exist?(photo_filename)
      File.delete(photo_filename) 
    else
      logger.info "photo not present- cannot delete"
    end
  end

  def in_album?(album)
    self.albums.include?(album)
  end

  private

  def store_photo
    if @file_data 
      logger.debug("got inside store_photo this time")
      #make photo store directory if doesn't already exist
      FileUtils.mkdir_p PHOTO_STORE
      #write photo data to file
      logger.debug("photo filename: #{photo_filename}")
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      #file only saves when it newly arrives to model being saved
      @file_data = nil
    else
      logger.debug("NO FILE DATA in store_photo")
    end
  end

end
