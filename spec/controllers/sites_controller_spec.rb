require 'spec_helper'

describe SitesController do
  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    describe "failure" do
      before(:each) do
        @attr = { :uri => "", :email => ""}
      end

      it "should not create a new site to watch" do
        lambda do
          post :create, :site => @attr
        end.should_not change(Site, :count)
      end

      it "should render the 'new' page" do
        post :create, :site => @attr
        response.should render_template('new')
      end
    end
  end

  describe "success" do
      before(:each) do
        @attr = {:uri => "http://www.uppers.com", :email => "username@uppers.com", :code => 200}
      end

      it "should create a site to watch" do
        lambda do
            post :create, :site => @attr
          end.should change(Site, :count).by(1)
      end

      it "should redirect to the pinging page" do
        post :create, :site => @attr
        response.should render_template('index')
      end

      it "should create a cookie" do
        post :create, :site => @attr
        cookies["ticket"].should_not be_nil
      end
    end
end
