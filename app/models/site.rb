require 'digest'

class Site < ActiveRecord::Base
  has_many :site_histories
  attr_accessible :uri, :email, :temp_id, :code

  before_save :generate_temp_id

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  uri_regex = /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/i

  validates :email, :presence => true,
                    :format => {:with => email_regex}

  validates :uri, :presence => true,
                  :format => {:with => uri_regex}

  def generate_temp_id
    self.temp_id ||= Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)
  end

  def ping
    logger.info "pinging site #{self.uri}"
    agent = Mechanize.new
    response = agent.get(self.uri)

    #self.uri = response.uri
    self.code = response.code
  end
end
