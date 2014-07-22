leaseweb-cdn-rest-api
=====================

Rubygem to talk to Leaseweb's CDN API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'leaseweb-cdn-rest-api'
```

And then execute:

```
$ bundle
```

Or install it yourself:

```
$ gem install leaseweb-cdn-rest-api
```

## Usage

Start by creating a new instance of the `LeasewebCDN` class, and passing your api token and customer number.

```ruby
api = LeasewebCDN.new(api_key, customer_number)
```

All return values are the direct JSON responses from Leaseweb converted into a Hash.

See: [documentation](https://my.leasewebcdn.com/manuals/api/html/introduction.html)
