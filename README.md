<p align="center">
  <img src="https://github.com/m2omou/wrapsquare/raw/master/wrapsquare.png" alt="Her" />
  <br />
  Wrapsquare is an ORM (Object Relational Mapper) that maps the Foursquare API resources to Ruby objects.
  <br /><br />
  <a href="http://badge.fury.io/rb/wrapsquare"><img src="https://badge.fury.io/rb/wrapsquare.svg" alt="Gem Version" height="18"></a>
</p>

---

## Installation

Install it as a gem in your `Gemfile` with its dependencies:

    gem "json"
    gem "typhoeus"
    gem "wrapsquare"

That’s it!

## Usage

### Authentication (Authenticated User Access)

Obtain your oauth token at the <a href="https://developer.foursquare.com/overview/auth">foursquare developer site</a>. Then replace `MY_TOKEN` with your own token and `VERSION` which is a date that essentially represents the "version" of the API you expect from Foursquare. 


```ruby
@foursquare = Wrapsquare::Base.new(:oauth_token => "MY_TOKEN",
                                   :version     => "VERSION")
```

### Get information about a venue

```ruby
@venue = @foursquare.venues.find("VENUE_ID")
```

### Search for venues (longitude & latitude)

The `latitude` and  `longitude` parameters are required for venue searches.

```ruby
@venues = @foursquare.venues.search(latitude, longitude, radius, limit)
```

#### Accessor

```ruby
# E.g "4adcda09f964a520e83321e3"
@venue.id

# E.g "Cathedrale Notre-Dame de Paris"
@venue.name

# E.g 48.85303971813958
@venue.latitude

# E.g 2.3497116565704346
@venue.longitude

# E.g "75004"
@venue.postcode

# E.g "France"
@venue.country

# E.g "Paris"
@venue.city

# E.g "6 parvis Notre-Dame"
@venue.address

# E.g "https://ss1.4sqi.net/img/categories_v2/building/religious_church_64.png"
@venue.icon
```

Currently this gem only handle venues.

License
=======
Wrapsquare Copyright 2014 Mourad Sabour, mourad.sabour[at]gmail.com.
