class Url < ActiveRecord::Base
  validates :url, :presence => true
  validates :url, :format => URI::regexp(%w(http https))

  def short_code
    id.to_s(36)
  end

  def self.find_using_short_code!(short_code)
    find short_code.to_i(36)
  end

  def self.click_counter(my_url)
    my_url.clicks = my_url.clicks + 1
    my_url.save

  end

end
