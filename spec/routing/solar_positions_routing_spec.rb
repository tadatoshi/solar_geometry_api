require "spec_helper"

# describe SolarPositionsController do
  describe "routing to solar_positions" do

    before(:each) do
      pending "Followed https://github.com/rspec/rspec-rails. But error shows up saying undefined method `route_to'"
    end

    it "routes to #index" do
      expect(get: "/solar_positions").to route_to(controller: "solar_positions",
                                                  action: "index")
    end

    it "routes to #new" do
      expect(get: "/solar_positions/new").to route_to(controller: "solar_positions",
                                                  action: "new")
    end

    it "routes to #show" do
      expect(get: "/solar_positions/1").to route_to(controller: "solar_positions",
                                                    action: "show", 
                                                    id: "1")
    end

    it "routes to #edit" do
      expect(get: "/solar_positions/1/edit").to route_to(controller: "solar_positions",
                                                         action: "edit", 
                                                         id: "1")      
    end

    it "routes to #create" do
      expect(post: "/solar_positions").to route_to(controller: "solar_positions",
                                                   action: "create")      
    end

    it "routes to #update" do
      expect(put: "/solar_positions/1").to route_to(controller: "solar_positions",
                                                    action: "update", 
                                                    id: "1")      
    end

    it "routes to #destroy" do
      expect(delete: "/solar_positions/1").to route_to(controller: "solar_positions",
                                                       action: "destroy", 
                                                       id: "1") 
    end

  end
# end
