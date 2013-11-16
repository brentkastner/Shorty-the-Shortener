class Url < ActiveRecord::Base
  validates :url, :presence => true
  validates :url, :format => URI::regexp(%w(http https))

  has_many :clicksources

  def short_code
    id.to_s(36)
  end

  def self.find_using_short_code!(short_code)
    find short_code.to_i(36)
  end

  def click_counter
    self.increment!(:clicks)

  end

end
