class AlexaTopSitesController < ApplicationController
  before_action :find_alexa_top_site, only: [:edit, :update]

  def index
    @top_sites = AlexaTopSite.limit(params.fetch(:limit, 100))
  end

  def edit
    render 'edit', layout: false
  end

  def update
    if @alexa_top_site.update(top_site_params)
      flash.now[:success] = 'Record saved successfully'
    end
    render 'edit', layout: false
  end

  private

  def find_alexa_top_site
    @alexa_top_site = AlexaTopSite.find(params[:id])
  end

  def top_site_params
    params.require(:alexa_top_site).permit(:url, :page_views_per_million, :page_views_per_user)
  end
end
