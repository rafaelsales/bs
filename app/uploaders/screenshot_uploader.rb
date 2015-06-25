class ScreenshotUploader < CarrierWave::Uploader::Base
  storage :file

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    '/assets/no-image.png'
  end

  def filename
    "#{model.url}.png"
  end

  def cache_dir
    "#{Rails.root}/tmp/uploads"
  end
end
