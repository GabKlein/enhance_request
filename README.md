## Description

With `enhance_request` you retrive more information from your rack request


## Install

```ruby
# Gemfile

gem 'enhance_request'

```

## Use

```ruby
# application_controller.rb

def append_info_to_payload(payload)
  super
  payload.merge!(EnhanceRequest.new(request).to_hash)
end
```
