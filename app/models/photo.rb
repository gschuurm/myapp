class Photo < ActiveRecord::Base

  #validates_presence_of :title #add other mandatory attrs here...
  after_save :store_photo
  belongs_to :album

  def photo_file=(file_data)
    unless file_data.blank?
      #store uploaded data in a private instance var
      @file_data = file_data
      #set title to be unique file name
      logger.debug("self.title is... #{self.title}")
    end
  end

  PHOTO_STORE = File.join(Rails.root, 'public', 'photo_store')

# write image file here
  def photo_filename
    File.join(PHOTO_STORE, "/#{self.title}_#{self.created_at}.jpg")
    #File.join(PHOTO_STORE, "/#{self.title}")
  end
 
  #def make_file
   # File.open("/Users/graceschuurmans/firstSite/myapp/public/test.txt", "w") { |f| f.write("I did it!") }
  #end

# return a path to photo to use in the view
  def photo_path
    "/photo_store/#{self.title}_#{self.created_at}.jpg"
  end

  def delete_photo
    if File.exist?(photo_filename)
      File.delete(photo_filename) 
    else
      logger.info "photo not present- cannot delete"
    end
  end

  private

  def store_photo
    if @file_data 
      logger.debug("got inside store_photo this time")
      #make photo store directory if doesn't already exist
      FileUtils.mkdir_p PHOTO_STORE

      self.timestamp = self.created_at
      logger.debug("self timestamp is... #{self.timestamp}")

      #write photo data to file
      logger.debug("photo filename: #{photo_filename}")
      begin
        file_content = Base64.decode64(@file_data) #try to decode, will write bytes if not base64
      rescue
        File.open(photo_filename, 'wb') do |f| 
          f.write(@file_data.read)
        end
      else
        File.open(photo_filename, 'wb') do |f| #write base64 decoded if from Pi
          f.write(file_content)
        end
      end
      #file only saves when it newly arrives to model being saved
      @file_data = nil
    else
      logger.debug("NO FILE DATA in store_photo")
    end
  end

end
