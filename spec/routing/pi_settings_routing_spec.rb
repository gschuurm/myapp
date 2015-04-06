require "spec_helper"

describe PiSettingsController do
  describe "routing" do

    it "routes to #index" do
      get("/pi_settings").should route_to("pi_settings#index")
    end

    it "routes to #new" do
      get("/pi_settings/new").should route_to("pi_settings#new")
    end

    it "routes to #show" do
      get("/pi_settings/1").should route_to("pi_settings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pi_settings/1/edit").should route_to("pi_settings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pi_settings").should route_to("pi_settings#create")
    end

    it "routes to #update" do
      put("/pi_settings/1").should route_to("pi_settings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pi_settings/1").should route_to("pi_settings#destroy", :id => "1")
    end

  end
end
