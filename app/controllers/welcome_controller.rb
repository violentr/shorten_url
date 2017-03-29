class WelcomeController < ApplicationController

  def index
    @short_urls = ShortUrl.all
    if params[:id]
      original_url = ShortUrl.find_by(short_url: params[:id]).original_url
      redirect_to "http://#{original_url}", :status => 301
    end
  end

  def shorten_url
    random = SecureRandom.hex.slice(0..5).upcase
    short_url = ShortUrl.create(short_url: random, original_url: params[:url] )
    render json: short_url
  end
end
