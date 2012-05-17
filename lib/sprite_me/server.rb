module SpriteMe
  class Server  < Goliath::API
    include Goliath::Rack::Types
    use Goliath::Rack::JSONP # if params[:callback] doesn't exist, it will just return what response returns
    use Goliath::Rack::Params
    use Goliath::Rack::Validation::Param,
          :key => "images", :as => JsonParams, :message => "images must be an array of urls"

    def response(env)
      images = Downloader.get_images(params["images"], config)
      resp = Yajl::Encoder.encode(format_response(params, images))
      [200, {},  resp]
    end

    def format_response(params, images)
      if params[:sprite]
        {:sprite => Image.sprite_images(images)}
      else
        images.each do |(k, v)|
          images[k] = v.data_uri
        end
      end
    end
  end
end
