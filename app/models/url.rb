class Url < ActiveRecord::Base
  validates :url, :presence => true
  validates_format_of :url, :with => /^(http|https|ftp|ftps):\/\/(([a-z0-9]+\:)?[a-z0-9]+\@)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix, :multiline => true

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
