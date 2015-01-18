class Photo < ActiveRecord::Base

  validates_presence_of :title #add other mandatory attrs here...
  after_save :store_photo

  def photo=(file_data)
    unless file_data.blank?
      #store uploaded data in a private instance var
      @file_data = file_data
      #find last part of filename to find extension
      self.extension = file_data.original_filename.split('.').last.downcase
    end
  end

  PHOTO_STORE = File.join(Rails.root, 'public', 'photo_store')

# write image file here
  def photo_filename
    File.join(PHOTO_STORE, "#{id}.#{extension}")
  end
  
# return a path to photo to use in the view
  def photo_path
    "/photo_store/#{id}/#{extension}"
  end

  private

  def store_photo
    print "just do something store_photo!"
    if @file_data 
      #make photo store directory if doesn't already exist
      FileUtils.mkdir_p PHOTO_STORE
      #write photo data to file
      File.open(photo_filename, 'wb') do |f|
        f.write(@file_data.read)
      end
      #file only saves when it newly arrives to model being saved
      @file_data = nil
    end
  end

end
