class AlexaImporter
  def import_top_sites(limit)
    session.top_sites.global(limit).each do |site|
      AlexaTopSite.create!(url: site.url,
                           rank: site.rank,
                           page_views_per_user: site.page_views_per_user,
                           page_views_per_million: site.page_views_per_million)
    end
  end

  private

  def session
    Ralexa.session(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY'])
  end
end
