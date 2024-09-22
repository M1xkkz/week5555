# Create an array with 5 numbers
p = [1,2,5,4,9]
# Access the second element in the array
puts p[1]
# Add a new number to the end of the array
p.push(7)
# Find the length of the array
puts p.length

# Create a hash with 3 key-value pairs (title, author, pages) representing a book
book = {title: "asd",author: "aer", pages: "reer"}
# Access the value for the key :author
puts book[:author]
# Add a new key :published_year with the value 1949
book[:published_year] = 1948
# Remove the key :pages from the hash
book.delete(:pages)