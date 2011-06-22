require 'spec_helper'

describe SiteHistory do
  before(:each) do
    @site =Factory(:site)
    @attr = { :code => 202, :checked_date => DateTime.current }
  end

  it "should create a new instance given valid attributes" do
    @site.site_histories.create!(@attr)
  end

  it "should require a code" do
    no_code_site_history = SiteHistory.new(@attr.merge(:code => ""))
    no_code_site_history.should_not be_valid
  end

  it "should require a checked date " do
    no_checked_date_site_history = SiteHistory.new(@attr.merge(:checked_date => ""))
    no_checked_date_site_history.should_not be_valid
  end

  describe "site association" do
    before(:each) do
      @site_history = @site.site_histories.create(@attr)
    end

    it "should have a site attribute" do
      @site_history.should respond_to(:site)
    end

    it "should have the right associated site" do
      @site_history.site_id.should == @site.id
      @site_history.site.should == @site
    end
  end
end
