class ShortUrl < ActiveRecord::Base

  def url
    original_url
  end
end
