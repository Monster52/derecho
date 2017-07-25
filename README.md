# Derecho


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'derecho'
gem 'httparty'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install derecho
    $ gem install httpary

## Usage

To begin using Derecho, grab an api key from [wunderground](https://www.wunderground.com/?apiref=28c522f84f4bd5f2
) weather and save it as an environment variable.

Instantiate the Derecho class with:
```ruby
weather = Derecho.new("<api_key", city, state)
```

Once the weather object has been created, you can start to pull data from the API with these commands

```ruby
weather.get_basic_weather_data
weather.get_daily_highs
weather.get_daily_lows
weather.get_weekdays
```

These methods all return an array 0 - 9.

`get_basic_weather_data` returns the forecast/conditions for each day. (10 day forecast)

`get_daily_highs` / `get_daily_lows` returns an array of the highs or lows for each day corresponding to the days of the week with the current day starting at the 0 index.

`get_weekdays` returns an array of the days with the current day starting at index 0

## Development

Derecho simple [demo](https://secret-caverns-98581.herokuapp.com/forecasts	)

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/derecho.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

