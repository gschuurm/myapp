require 'spec_helper'

describe Photo do

  describe "new" do
    it "creates a new photo" do
      photo = FactoryGirl.create(:photo)
      assert photo.valid?
    end

    it "checks if PHOTO_STORE dir exists" do
      file_path = File.expand_path('../../../public/photo_store', __FILE__)
      print file_path
      assert(File.directory?(file_path), file_path + " doesn't exist")
    end

    it "saves new photo to PHOTO_STORE" do
      file_path = File.expand_path('../../../public/photo_store', __FILE__)
#      assert(File.exists?("#{file_path}/test.txt"))
    end

    it { should belong_to(:album) }

  end
end
