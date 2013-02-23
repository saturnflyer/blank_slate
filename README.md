# blank_slate

BlankSlate is useful for implementing the Null Object pattern.

This gem allows you to create null objects without resorting to
method_missing to catch every message passed. Using method_missing
means that your objects will respond to any method regardless of
the behavior you designed in your other related classes.

## Installation

Add this line to your application's Gemfile:

    gem 'blank_slate'

## Usage

Here's an example of how you might use it.

A common example of a null object is to use `method_missing` to return the object itself. That allows you to continually call missing methods on the null object. The blank slate approach defines methods based upon another class. This keeps the interface to both objects (valid object and null object) the same.

```ruby

    # Setup some sort of class... this can be anything

    require 'delegate'
    class UserPresenter < SimpleDelegator
      def recent_searches
        last_queries.collect{|query| %{<a href="http://site.co.uk/q?=#{query}">#{query}</a>}}.join(',')
      end

      def welcome
        "Welcome! We're so glad to have you!"
      end
    end

    require 'blank_slate'
    include BlankSlate

    # Create a blank slate but provide a specific value for a certain method

    GuestPresenter = BlankSlate(UserPresenter) do
      def welcome
        "Sign-in or sign-up, cowboy!"
      end
    end

    def Present(user)
      user.authenticated? ? UserPresenter.new(user) : GuestPresenter.new(user)
    end

    presenter = Present(current_user)

    presenter.welcome
    presenter.recent_searches # unauthenticated outputs nothing
    presenter.bad_method # raises an error in either case
```

In the example above the call to `bad_method` would have continued with a null object (using method_missing) but failed for the good object. With BlankSlate, we get the behavior we want from both our regular class and the null stand-in.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
