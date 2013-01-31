require "spec_helper"

describe ProductFamiliesController do
  describe "routing" do

    it "routes to #index" do
      get("/product_families").should route_to("product_families#index")
    end

    it "routes to #new" do
      get("/product_families/new").should route_to("product_families#new")
    end

    it "routes to #show" do
      get("/product_families/1").should route_to("product_families#show", :id => "1")
    end

    it "routes to #edit" do
      get("/product_families/1/edit").should route_to("product_families#edit", :id => "1")
    end

    it "routes to #create" do
      post("/product_families").should route_to("product_families#create")
    end

    it "routes to #update" do
      put("/product_families/1").should route_to("product_families#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/product_families/1").should route_to("product_families#destroy", :id => "1")
    end

  end
end
