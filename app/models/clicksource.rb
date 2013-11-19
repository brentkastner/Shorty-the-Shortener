require 'geoip'

class Clicksource < ActiveRecord::Base
  validates :url_id, :presence => true
  belongs_to :url



  def city
    c = GeoIP.new('lib/GeoLiteCity.dat').city(self.ip)
    c.city_name.encode('utf-8')
  end

  def country
    c = GeoIP.new('lib/GeoLiteCity.dat').city(self.ip)
    c.country_name.encode('utf-8')
  end

end
