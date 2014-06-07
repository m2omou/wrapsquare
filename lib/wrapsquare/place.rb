module Wrapsquare
  class Place
    require 'json'

    def initialize(place)
      @place = place
    end

    def id
      @place["id"]
    end

    def longitude
      @place["location"]["lng"]
    end

    def latitude
      @place["location"]["lat"]
    end

    def name
      @place["name"]
    end

    def postcode
      @place["location"]["postalCode"]
    end

    def city
      @place["location"]["city"]
    end

    def address
      @place["location"]["address"]
    end

    def country
      @place["location"]["country"]
    end

    # return the icon url if exist or return the default icon
    def icon
      if (@place["categories"][0] != nil)
        @place["categories"][0]["icon"]["prefix"] + "64" + @place["categories"][0]["icon"]["suffix"]
      else
        "https://ss1.4sqi.net/img/categories_v2/building/default_64.png"
      end
    end

    # Serialize object into json
    def to_json(*a)
      {
          :id => self.id,
          :longitude => self.longitude,
          :latitude => self.latitude,
          :name => self.name,
          :postcode => self.postcode,
          :city => self.city,
          :address => self.address,
          :country => self.country,
          :icon => self.icon
      }.to_json(*a)
    end

  end

end