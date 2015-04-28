require_relative "config/env"

class URLShortener < Sinatra::Base

  helpers do
    def random_hash
      (Time.now.to_i + rand(36**8)).to_s(36)
    end
  end

  get '/' do
    haml :index
  end

  post '/' do
    unless (params[:url] =~ URI::regexp).nil?
      @token = random_hash
      R.set "links:#{@token}", params[:url]
      haml :shortened
    else
      @error = "Please enter a valid URL."
      haml :index
    end
  end

  get '/:token/?' do
    url = R.get "links:#{params[:token]}"
    unless url.nil?
      redirect(url)
    else
      haml :expired
    end
  end

end
