# Pocket Api

Non-official Ruby wrapper for [Pocket API](https://getpocket.com/developer/)


## Proposal


### Retrieve

```ruby
client = PocketAPI::Client.new(access_token, { detailType: "simple" })
client.params[:sort] = "newest"
items = client.retrieve() #=> returns Collection of Items


items.unread #=> Returns PocketAPI::Item Collection with only unread items
items.archived #=> Returns PocketAPI::Item Collection with only archived items
items.deleted #=> Returns PocketAPI::Item Collection with only deleted items

items.where(contentType: "article") #=> Returns PocketAPI::Item Collection with only items tagged as `contentType == "article"`, etc...

item.tags #=> Returns PocketAPI::Tag Collection
item.authors #=> Returns PocketAPI::Auther Collection
item.images #=> Returns PocketAPI::Image Collection
item.videos #=> Returns PocketAPI::Video Collection
```


### Add

```rb
item.create!(params) #=> return Item
```

### Modify

```rb
item.update!({
  "action" : "archive",
  "item_id" : "229279689",
  "time"   : "1348853312"
})

item.archive!(time=nil)
item.readd!(time=nil)
item.favorite!(time=nil)
item.unfavorite!(time=nil)
item.delete!(time=nil)

item.tags.remove!(['first', 'second'])
item.tags.replace!(['first', 'second'])
item.tags.clear!(['first', 'second'])
item.tags.rename!(old_tag, new_tag)
item.tags.first.rename!('haha')
```

## Development

First, Make sure you installed ruby and bundler, and then follow steps below:

```sh
git clone xxx ooo
cd ooo
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



