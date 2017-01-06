require 'geocoder'

module EnhanceRequest
  class Location
    KEYS = [:country, :region, :postal_code, :city, :latitude, :longitude].freeze

    def initialize(ip)
      @ip = ip
    end

    def to_hash
      KEYS.each_with_object({}) { |key, memo| memo[key] = send(key); memo }
    end

    def country
      location.try(:country).presence
    end

    def region
      location.try(:state).presence
    end

    def postal_code
      location.try(:postal_code).presence
    end

    def city
      location.try(:city).presence
    end

    def latitude
      location.try(:latitude).presence
    end

    def longitude
      location.try(:longitude).presence
    end

    protected

    def location
      @location ||= begin
                      Geocoder.search(@ip).first
                    rescue => e
                      $stderr.puts e.message
                      nil
                    end
    end
  end
end
