## ImagePaths

Welcome to my new gem!
 
It is intended to easy get all images paths from HTML page.

## Installation

gem install image_paths-0.1.0.gem in your __Gemfile__

```ruby
gem 'image_paths'
```

And then execute:

    $ bundle

Or install it yourself in your project folder as:

    $ gem install image_paths

## Usage


    require 'image_paths'
 
    ImagePaths.at('https://moikrug.ru/vacancies/1000031431')

where 'https://moikrug.ru/vacancies/1000031431' - is HTML page url where images paths are to collected.

#### Example output

    A Ruby array: 
    => ["https://www.facebook.com/tr?id=203653866652939&ev=PageView&noscript=1",
       "https://habrastorage.org/getpro/moikrug/uploads/company/100/005/255/1/logo/medium_f19113ec4c4fdac7af49f748ba45fedc.png",
       "https://habracdn.net/mk/assets/no_content.icon.access_denied-999f611531008ac991f274b594fa49d5.png",
       "https://mc.yandex.ru/watch/38498795",
       "//stats.tmtm.ru/piwik.php?idsite=7"]

In case there are no images on the page - output array will be empty: [].



## Development
install dependencies:

    `bin/setup`
     
run the tests:

     `rake spec` 
     or
     'bundle exec rspec'

To install this gem onto your local machine:

     `bundle exec rake install`

To release a new version, update the version number in `version.rb`,
and then run `bundle exec rake release` 
to create a git tag for the version.
Then push git commits and tags,
push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[BlookHo]/image_paths. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

