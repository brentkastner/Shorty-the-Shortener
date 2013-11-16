require 'geoip'

class Clicksource < ActiveRecord::Base
  validates :url_id, :presence => true
  belongs_to :url



  def city
    c = GeoIP.new('lib/GeoLiteCity.dat').city(self.ip)
    c.city_name
  end

  def country
    c = GeoIP.new('lib/GeoLiteCity.dat').city(self.ip)
    c.country_name
  end

end
