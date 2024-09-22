#Create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
  attr_accessor :name, :email, :password, :rooms

  def initialize(name, email, password)
    @name = name
    @password = password
    @email = email
    @rooms = []
  end

  # Method so the user can enter a room
  def enter_room(room)
    @rooms << room unless @rooms.include?(room)
    room.add_user(self)
  end

  #  Method so the user can send a message to a room
  def send_message(room, content)
    if @rooms.include?(room)
      message = Message.new(self, room, content)
      room.broadcast(message)
    else
      puts "#{name} is not in the room: #{room.name}"
    end
  end

  #  Method to acknowledge message
  def acknowledge_message(message)
    puts "#{name} received message in #{message.room.name}: #{message.content}"
  end
end

# Create a new Class, Room, that has the following attributes:
# - name
# - description
# - users
class Room
  attr_accessor :name, :description, :users

  def initialize(name, description)
    @name = name
    @description = description
    @users = []
  end

  # Method to add a user to the room
  def add_user(user)
    @users << user unless @users.include?(user)
  end

  #  Method to broadcast a message to all users
  def broadcast(message)
    @users.each do |user|
      user.acknowledge_message(message)
    end
  end
end

#  Create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
  attr_accessor :user, :room, :content

  def initialize(user, room, content)
    @user = user
    @room = room
    @content = content
  end
end

# Example Usage:

# Create users
user1 = User.new("Mick", "MIck@example.com", "password123")
user2 = User.new("Mix", "bob@example.com", "password456")

# Create a room
room = Room.new("Mahalnw", "enjoy living")

# Users enter the room
user1.enter_room(room)
user2.enter_room(room)

# User1 sends a message
user1.send_message(room, "Hello, everyone!")

# User2 sends a message
user2.send_message(room, "Hi Micklnwza!")
