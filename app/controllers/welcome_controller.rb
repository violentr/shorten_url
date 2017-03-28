class WelcomeController < ApplicationController

  def index
    @short_urls = ShortUrl.all.map(&:original_url)
  end

  def shorten_url
    random = SecureRandom.hex
    url = params[:short_url][:url] || ""
    ShortUrl.create(short_url: random, original_url: url)
  end
end
