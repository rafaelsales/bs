class AddScreenshotToAlexaTopSites < ActiveRecord::Migration
  def change
    add_column :alexa_top_sites, :screenshot, :string
  end
end
