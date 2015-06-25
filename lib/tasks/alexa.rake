namespace :alexa do
  task :import_top_sites => :environment do
    puts "Deleting existing alexa top sites database"
    AlexaTopSite.delete_all

    puts "Importing Alexa Top 100 sites"
    AlexaImporter.new.import_top_sites(100)

    puts "Storing screenshots for Alexa Top 100 sites"
    AlexaTopSite.find_each do |top_site|
      puts "Taking screenshot for #{top_site.url}"
      begin
        Timeout::timeout(30) { AlexaImporter.new.store_screenshot_for(top_site) }
      rescue => e
        logger.error e
        puts "Error when taking screenshot for #{top_site.url}. Skipping..."
      end
    end
  end

  def logger
    Logger.new(Rails.root.join('log', 'alexa_importer.log'))
  end
end
