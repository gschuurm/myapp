require 'spec_helper'

describe Photo do

  describe "#new" do
    it "checks if PHOTO_STORE dir exists" do
      file_path = File.expand_path('../../../public/photo_store', __FILE__)
      print file_path
      assert(File.directory?(file_path), file_path + " doesn't exist")
    end

    it "saves new photo to PHOTO_STORE" do
      file_path = File.expand_path('../../../public/photo_store', __FILE__)
      #foto = FactoryGirl.new
      make_file
      assert(File.exists?("#{file_path}/test.txt"))
    end

  end

end
