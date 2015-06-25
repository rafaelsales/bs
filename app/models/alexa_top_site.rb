class AlexaTopSite < ActiveRecord::Base
  validates :url, :rank, presence: true

  mount_uploader :screenshot, ScreenshotUploader
end
