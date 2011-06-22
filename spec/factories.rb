Factory.define :site do |site|
  site.email "admin@uppers.ca"
  site.uri "http://www.mixcloud.com"
  site.temp_id "d1ec027ae899f341f8cdcb5ab853f72634b57eff"
end

Factory.sequence :temp_id do |n|
  "d1ec027ae899f341f8cdcb5ab853f72634b57e#{n}"
end

Factory.define :site_histories do |site_history|
  site_history.code 202
  site_history.checked_date DateTime.current
  site_history.association :site
end