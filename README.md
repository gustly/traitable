# Traitable

[![Build Status](https://travis-ci.org/gustly/traitable.png?branch=master)](https://travis-ci.org/gustly/traitable)

Traits are permissible roles for CanCan that are connected to specific
models.

Without CanCan, it's just a great way to abstract
permissions away from your model.

## Installation

Add this line to your application's Gemfile:

    gem 'traitable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install traitable

## Usage

### Defining Traits

Create one or more trait classes to define traits in. For example:

```ruby
class PostTraits < Traitable::Base
  trait :post_author do |post|
    post.author == user
  end

  trait :post_commenter do |post|
    user.verified
  end

  trait :post_viewer do |post|
    true
  end
end
```

### Using traits

```ruby
# somewhere in your application controller

include Traitable

def user
  session[:user] # or whatever your permissions system can expose. Traitable expects 'user'
end
```

```ruby
# in a view or a controller

traits.post_author?(@post) # answers the question that is begging :D
```

### Integrating with CanCan

TODO: document integration with CanCan

## Trait auto-document-gen

Add the following to your rake tasks:

```ruby
# lib/tasks/traits.rake

namespace :traits do
  desc 'Document traits (in html file)'
  task :doc => :environment do
    require 'traitable/document_runner'

    doc = Traitable::DocumentRunner.new().to_doc
    
    file = File.open('public/traits.html','w')
    file << doc
    file.close
    
    puts "Document written, run:\nopen public/traits.html"
  end
end
```

then run:

```bash
rake traits:doc
```

The task will create a html document describinfg the traits defined in
your app. 

**Note:** The traits won't appear unless the rails environment or your rake task 
requires your traits first.


