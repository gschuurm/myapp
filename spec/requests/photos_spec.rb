require 'spec_helper'

describe "Photos" do
  describe "GET /photos" do
    it "works! (now write some real specs)" do
      get albums_path
      response.status.should be(200)
    end

    it "displays photos" do
      # Photo.create!(factory girl??)
    end
  end
end
