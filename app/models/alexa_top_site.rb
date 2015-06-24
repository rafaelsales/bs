class AlexaTopSite < ActiveRecord::Base
  validates :url, :rank, presence: true
end
