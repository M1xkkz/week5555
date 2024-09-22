foo = ['a', 'b', 'c']

foo.each { puts "hello" }

foo.each do
  puts "hello555"
end

def greet
  puts "hi there"
end

# you can pass a block as an argument to any method call
# even if the method doesn't do anything with the block.
greet { puts "hello" }

# a method can invoke an associated block one or more times
# using the Ruby yield statement.
def call_block
  puts "Start of method"
  yield
  yield
  puts "End of method"
end

call_block { puts "In the block" }