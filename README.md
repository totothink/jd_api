# JdApi

Jingdong api with ruby

## Installation

Add this line to your application's Gemfile:

    gem 'jd_api'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jd_api

## Usage

```ruby
@app_key = 'app_key'
@app_secret = 'app_secret'
client = JdApi::Client.new(@app_key, @app_secret)

p client.base_product('981821,1094930,1115374')
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
