# Pocket Api

Non-official Ruby wrapper for [Pocket API](https://getpocket.com/developer/)


## Install

```
gem install pocket-api
```

## Usage

### Configuration

```rb
PocketAPI.configure do |config|
  config.consumer_key = 'consumer-key'
end
```

### Fetch Items


```rb
access_token = "UserAccessToken"
client = PocketAPI::Client.new(access_token)
items = client.retrieve({ detailType: "simple" }) #=> returns Collection of Items

article_items = items.where(is_article: true)
item = article_items.first
item.is_article #=> true
item.status #=> 0
```

## TODO Usage

### Fetch Items (TODO, priority=1)

```rb
items.unread #=> Returns PocketAPI::Item Collection with only unread items
items.archived #=> Returns PocketAPI::Item Collection with only archived items
items.deleted #=> Returns PocketAPI::Item Collection with only deleted items
item.tags #=> Returns PocketAPI::Tag Collection
item.authors #=> Returns PocketAPI::Auther Collection
item.images #=> Returns PocketAPI::Image Collection
item.videos #=> Returns PocketAPI::Video Collection

item.status #=> :unread
item.unread? #=> boolean
item.archived? #=> boolean
item.deleted? #=> boolean
```

### Create Item (TODO, priority=2)

```rb
PocketAPI::Item.create!(params)
#=> PocketAPI::Item
```

### Update Item (TODO, priority=3)

#### Basic Usage

follow [https://getpocket.com/developer/docs/v3/modify](https://getpocket.com/developer/docs/v3/modify)

```rb
params = {
  action: "archive",
  item_id: "229279689",
  time: Time.now
}
item.update!(params)
# => true
```

#### Advance Usage

```rb
item.archive!(time=nil)
# => true

item.readd!(time=nil)
# => true

item.favorite!(time=nil)
# => true

item.unfavorite!(time=nil)
# => true

item.delete!(time=nil)
# => true

item.tags.remove!(['first', 'second'])
# => true

item.tags.replace!(['first', 'second'])
# => true

item.tags.clear!(['first', 'second'])
# => true

item.tags.rename!(old_tag, new_tag)
# => true

tag = item.tags.first
tag.rename!('haha')
# => true
```

### Errors (TODO, priority=unknown)

[https://getpocket.com/developer/docs/errors](https://getpocket.com/developer/docs/errors)



## Development

First, Make sure you installed ruby and bundler, and then follow steps below:

```sh
git clone https://github.com/wayne5540/pocket_api pocket_api
cd pocket_api
bundle install
```

### Autoatically run test in shell

```sh
bundle exec guard
```

### Test manually

```sh
bundle exec rspec
```

### Run locally

```sh
gem build build pocket_api.gemspec
  # =>
  # Successfully built RubyGem
  # Name: pocket_api
  # Version: 0.0.0
  # File: pocket_api-0.0.0.gem
gem install pocket_api-0.0.0.gem
irb
```

then

```rb
retuire 'pocket_api'
# => true
```

## TODO or not TODO, that is the question...

* Support [limit header](https://getpocket.com/developer/docs/errors)
* Support [Authentication](https://getpocket.com/developer/docs/authentication)
* Remove pocket-ruby dependency or add test for it.

## License

See [LICENSE](LICENSE.md)
