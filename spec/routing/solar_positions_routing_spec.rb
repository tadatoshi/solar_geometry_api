require "spec_helper"

describe SolarPositionsController do
  describe "routing" do

    it "routes to #index" do
      get("/solar_positions").should route_to("solar_positions#index")
    end

    it "routes to #new" do
      get("/solar_positions/new").should route_to("solar_positions#new")
    end

    it "routes to #show" do
      get("/solar_positions/1").should route_to("solar_positions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/solar_positions/1/edit").should route_to("solar_positions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/solar_positions").should route_to("solar_positions#create")
    end

    it "routes to #update" do
      put("/solar_positions/1").should route_to("solar_positions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/solar_positions/1").should route_to("solar_positions#destroy", :id => "1")
    end

  end
end
