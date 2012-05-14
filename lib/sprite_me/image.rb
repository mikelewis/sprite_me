module SpriteMe
  class Image
    def self.sprite_images(images)

    end

    def initialize(type, body)
      @type, @body = type, body
    end

    def data_uri
      content = Base64.encode64(@body).gsub("\n", "")
      "data:#{@type};base64,#{content}"
    end
  end
end