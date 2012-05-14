module SpriteMe
  class JsonParams
    def coerce(value, opts={})
      begin
        MultiJson.load(value)
      rescue
        return opts[:default] if opts[:default]
        raise Goliath::Rack::Validation::FailedCoerce.new([400, {}, opts[:message] || "Invalid JSON"])
      end
    end
  end
end
