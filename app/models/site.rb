require 'digest/sha1'

class Site < ActiveRecord::Base
  attr_accessible :uri, :email, :temp_id

  def after_initialize
    self.temp_id = generate_temp_id
  end
  

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  uri_regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/i

  validates :email, :presence => true,
                    :format => {:with => email_regex}

  validates :uri, :presence => true,
                  :format => {:with => uri_regex}

  def generate_temp_id
    Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)
  end
  
end
