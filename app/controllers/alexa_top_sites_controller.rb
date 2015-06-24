class AlexaTopSitesController < ApplicationController
  def index
    @top_sites = AlexaTopSite.limit(params.fetch(:limit, 100))
  end
end
