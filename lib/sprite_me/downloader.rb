module SpriteMe
  class Downloader
    def self.get_responses(urls)
      d = new(urls)
      d.get_responses
    end

    def initialize(urls)
      urls = Array(urls) unless urls.is_a? Array
      @urls = urls
    end

    def get_responses
      get_images download_urls
    end

    private

    def download_urls
      multi = EventMachine::Synchrony::Multi.new
      @urls.each do |url|
        multi.add url,  EventMachine::HttpRequest.new(url, :redirects => 5).aget
      end
      multi.perform
    end

    def get_images(replies)
      replies.requests.inject({}) do|h, (url, http_request)|
        h[url] = Image.new(http_request.response_header['CONTENT_TYPE'], http_request.response)
        h
      end
    end
  end
end