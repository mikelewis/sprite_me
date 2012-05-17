module SpriteMe
  class Downloader
    DEFAULT_HTTP_CONNECTION_OPTS = {}
    DEFAULT_HTTP_REQUEST_OPTS = {:redirects => 1}
    def self.get_images(urls, config={})
      d = new(urls, config)
      d.get_images
    end

    def initialize(urls, config={})
      urls = Array(urls) unless urls.is_a? Array
      @urls = urls
      @http_connection_opts = DEFAULT_HTTP_CONNECTION_OPTS.merge(config[:http_connection] || {})
      @http_request_opts = DEFAULT_HTTP_REQUEST_OPTS.merge(config[:http_request] || {})
    end

    def get_images
      images_from_downloads download_urls
    end

    private

    def download_urls
      multi = EventMachine::Synchrony::Multi.new
      @urls.each do |url|
        multi.add url,  EventMachine::HttpRequest.new(url, @http_connection_opts).aget(@http_request_opts)
      end
      multi.perform
    end

    def images_from_downloads(replies)
      replies.requests.inject({}) do|h, (url, http_request)|
        h[url] = Image.new(http_request.response_header['CONTENT_TYPE'], http_request.response)
        h
      end
    end
  end
end