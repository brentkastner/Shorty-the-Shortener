class Clicksource < ActiveRecord::Base
  validates :url_id, :presence => true
  belongs_to :url
end
