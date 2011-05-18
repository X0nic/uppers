require 'spec_helper'

describe SiteHistory do
  before(:each) do
    @attr = { :code => 202, :checked_date => DateTime.current }
  end

  it "should create a new instance given valid attributes" do
    SiteHistory.create!(@attr)
  end

  it "should require a code" do
    no_code_site_history = SiteHistory.new(@attr.merge(:code => ""))
    no_code_site_history.should_not be_valid
  end

  it "should require a checked date " do
    no_checked_date_site_history = SiteHistory.new(@attr.merge(:checked_date => ""))
    no_checked_date_site_history.should_not be_valid
  end
end
