class SiteHistory < ActiveRecord::Base
  belongs_to :site
  attr_accessible :code, :checked_date

  validates :code, :presence => true
  validates :checked_date, :presence => true
end
