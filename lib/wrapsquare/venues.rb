module Wrapsquare
  class Venues

    def initialize(foursquare)
      @fq = foursquare
    end

    # find a specific venue
    def find(id)
      @venue = @fq.get("#{id}/?", {})["venue"]
      return Wrapsquare::Place.new(@venue)
    end

    # search venues by latitude & longitude
    def search(lat, lon, radius = 800, limit = 10)
      @venues = @fq.get("search?", {:ll => "#{lat},#{lon}", :intent => "browse", :limit => limit, :radius => radius})
      # map the venues into objets
      @places = []
      @places += @venues["venues"].map do |item|
        Wrapsquare::Place.new(item)
      end
      return @places
    end
  end

end