class Site < ActiveRecord::Base
  attr_accessible :uri, :email

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  uri_regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/i

  validates :email, :presence => true,
                    :format => {:with => email_regex}

  validates :uri, :presence => true,
                  :format => {:with => uri_regex}
end