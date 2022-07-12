# 1.1.2

Minor change to simplify the methods that are iterated when creating the BlankSlate class.

# 1.1.1

1.1.0 used method_defined? which has an arity of 2 in Ruby 2.6 but 1 in previous rubies.
This was changed to check instance_methods(false)

# 1.1.0

Make BlankSlate a shallow copy of a class. Ancestor methods are preserved.

# 1.0.0

Initial release
