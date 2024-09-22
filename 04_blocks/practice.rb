# Write a method that takes a block and prints "Hello, World!"
def say_hello
    yield
end

tum = ['say']

tum.each{puts 'Hello, World!'}
# Write a method that takes a block and prints numbers 1 to 5
def count
    1.upto(5) {|num| yield num}
end
count {|num| puts num}

# count_numbers { |num| puts num }
1.upto(5) { |i| print i }
# Write a method that uses yield with a block that accepts two parameters
def call_block
    puts "Start of method"
    yield
    yield
    puts "End of method"
  end

  call_block { puts "In the block" }
  
# multiply { |a, b| puts a * b }
def multiplypoo
    yield(8, 9)
    
  end
multiplypoo { |a, b| puts a * b }
# Write a method that checks if a block is provided and executes it
# greet # Output: No block given
# greet { puts "Hello, World!" } # Output: Hello, World!
def greet
    if block_given?
        yield
        else
            puts "no block"
        end 
    end
    greet
    greet {puts "Hello"}