require 'geoip'

class Clicksource < ActiveRecord::Base
  validates :url_id, :presence => true
  belongs_to :url



  def city(ip)
    c = GeoIP.new('lib/GeoLiteCity.dat').city(ip)
    c.city_name
  end

  def country(ip)
    c = GeoIP.new('lib/GeoLiteCity.dat').city(ip)
    c.country_name
  end

end
