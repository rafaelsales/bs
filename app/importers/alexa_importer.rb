class AlexaImporter
  def import_top_sites(limit)
    session.top_sites.global(limit).each do |site|
      AlexaTopSite.create!(url: site.url,
                           rank: site.rank,
                           page_views_per_user: site.page_views_per_user,
                           page_views_per_million: site.page_views_per_million)
    end
  end

  def store_screenshot_for(top_site)
    begin
      file = take_screenshot_for(top_site)
      top_site.update!(screenshot: file)
    ensure
      FileUtils.rm(file) if file.try(:exists?)
    end
  end

  private

  def session
    Ralexa.session(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  end

  def take_screenshot_for(top_site)
    Screencap::Fetcher.new(URI::HTTP.build(host: top_site.url).to_s).fetch(
      output: Rails.root.join("tmp", "#{top_site.url}.png"),
      width: 640,
      height: 480
    )
  end
end
