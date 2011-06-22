require 'spec_helper'

describe Site do
  before(:each) do
    @attr = { :email => "admin@uppers.ca", :uri => "http://www.uppers.com" }
  end

  it "should create a new instance given valid attributes" do
    Site.create!(@attr)
  end

  it "should require an email" do
    no_email_site = Site.new(@attr.merge(:email => ""))
    no_email_site.should_not be_valid
  end
  
  it "should accept valid email addresses" do
    addresses = %w[username@foo.com THE_USERNAME@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_site = Site.new(@attr.merge(:email => address))
      valid_email_site.should be_valid
    end
  end

  it "should reject invalid email addresses" do
    addresses = %w[username@foo,com username_at_foo.org example.username@foo.]
    addresses.each do |address|
      invalid_email_site = Site.new(@attr.merge(:email => address))
      invalid_email_site.should_not be_valid
    end
  end

  it "should require a uri" do
    no_uri_site = Site.new(@attr.merge(:uri => ""))
    no_uri_site.should_not be_valid
  end

  it "should accept valid uri addresses" do
    uri_addresses = %w[http://www.test.com https://www.test.org http://www.test.co.uk]
    uri_addresses.each do |uri|
      valid_uri_site = Site.new(@attr.merge(:uri => uri))
      valid_uri_site.should be_valid
    end
  end

  it "should reject invalid uri addresses" do
    uri_addresses = %w[http://www.test. https://www..org]
    uri_addresses.each do |uri|
      valid_uri_site = Site.new(@attr.merge(:uri => uri))
      valid_uri_site.should_not be_valid
    end
  end

  it "should generate a temp id" do
    site = Site.new(@attr)
    site.save
    
    site.temp_id.should_not be_nil
    site.temp_id.length.should == 40
  end

  it "should not change temp id when pulled out of db" do
    site = Site.new(@attr)
    site.save

    new_site = Site.find(site.id)
    new_site.temp_id.should == site.temp_id
  end

  it "should not change the temp id when saved to" do
    site = Site.new(@attr)
    site.save

    temp_id = site.temp_id
    site.save

    site.temp_id.should == temp_id
  end

  describe "site_histories associations" do

    before(:each) do
      @site = Site.create(@attr)
    end

    it "should have a site_histories attribute" do
      @site.should respond_to(:site_histories)
    end
  end
end
