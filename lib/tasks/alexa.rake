namespace :alexa do
  task :import_top_sites => :environment do
    puts "Deleting existing alexa top sites database"
    AlexaTopSite.delete_all

    puts "Importing Alexa Top 100 sites"
    AlexaImporter.new.import_top_sites(100)
  end
end
