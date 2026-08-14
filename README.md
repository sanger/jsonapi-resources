# JSONAPI::Resources (Sanger fork)

`JSONAPI::Resources`, or "JR", provides a framework for developing an API server that complies with the
[JSON:API](http://jsonapi.org/) specification.

Like JSON:API itself, JR's design is focused on the resources served by an API. JR needs little more than a definition
of your resources, including their attributes and relationships, to make your server compliant with JSON API.

JR is designed to work with Rails 5.1+, and provides custom routes, controllers, and serializers. JR's resources may be
backed by ActiveRecord models or by custom objects.

## Documentation

Full documentation can be found at [http://jsonapi-resources.com](http://jsonapi-resources.com), including the [v0.10 alpha Guide](http://jsonapi-resources.com/v0.10/guide/) specific to this version.

## Demo App

We have a simple demo app, called [Peeps](https://github.com/cerebris/peeps), available to show how JR is used.

## Client Libraries

JSON:API maintains a (non-verified) listing of [client libraries](http://jsonapi.org/implementations/#client-libraries)
which _should_ be compatible with JSON:API compliant server implementations such as JR.

## Installation

Add JR to your application's `Gemfile`:

```
gem 'jsonapi-resources'
```

And then execute:

```bash
bundle
```

Or install it yourself as:

```bash
gem install jsonapi-resources
```

**For further usage see the [v0.10 alpha Guide](http://jsonapi-resources.com/v0.10/guide/)**

## Sanger-specific release process

There are two versions of the gem which we use for production. The version 1 series has unique customisations and is used by Sequencescape. The version 2 series is a more generic version which is used by Traction.

Check which versions we have published at https://rubygems.org/gems/sanger-jsonapi-resources

### For version 1 series

- Create a branch from **develop**, apply fixes.
- Change version number in `lib/jsonapi/resources/version.rb` . This file is read by the gemspec during publication.
- Test Sequencescape with the gem from the branch.
- Merge the branch into develop.
<!-- list separator -->
- Checkout the develop branch.
- Execute `gem build jsonapi-resources.gemspec` which builds sanger-jsonapi-resources-0.1.x.gem in this case.
- Execute `gem push sanger-jsonapi-resources-0.1.x.gem` which publishes the gem.

### For version 2 series

- Create a branch from **master**, apply fixes.
- Change version number in `lib/jsonapi/resources/version.rb` . This file is read by the gemspec during publication.
- Test Traction with the gem from the branch.
- Merge the branch into master.
<!-- list separator -->
- Checkout the master branch.
- Execute `gem build jsonapi-resources.gemspec` which builds sanger-jsonapi-resources-0.2.x.gem in this case.
- Execute `gem push sanger-jsonapi-resources-0.2.x.gem` which publishes the gem.

### Publication

You will be notified by email for each. You will also receive one email for API key setup. The first push will ask email and password for the account, which are in KeePass (search for "gem").

> [!TIP]
> The process above can be improved by creating new releases first and then publish gems from those releases (tags) rather than publications from master (0.2) and develop (0.1) branches. Still create the releases to make tags in this work though.

> [!NOTE]
> The email and password for gem publication is a recent addition to the credentials database. Pull latest changes in the credentials repo.

> [!IMPORTANT]
> Developers need to execute `bundle install`.

## Contributing

See CONTRIBUTING.md for details.

## License

Copyright 2014-2021 Cerebris Corporation. MIT License (see LICENSE for details).
