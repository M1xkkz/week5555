# create a new Class, User, that has the following attributes:
# - name
# - email
# - password
class User
    attr_accessor :name, :email, :password, :rooms
  
    def initialize(name, email, password)
      @name = name
      @email = email
      @password = password
      @rooms = []
    end
# create a new Class, Room, that has the following attributes:
# - name
# - description
# - users

# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content

    def enter_room(room)
      unless @rooms.include?(room)
        @rooms << room
        room.add_user(self)
        puts "#{@name} has entered the room: #{room.name}"
      end
    end
  
    def send_message(room, content)
      message = Message.new(self, room, content)
      room.broadcast(message)
    end
  
    def acknowledge_message(room, message)
      puts "#{@name} acknowledged message in #{room.name}: #{message.content}"
    end
  end
  
  class Room
    attr_accessor :name, :description, :users
  
    def initialize(name, description)
      @name = name
      @description = description
      @users = []
    end
  
    def add_user(user)
      @users << user unless @users.include?(user)
    end
# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)  
    def broadcast(message)
      puts "Broadcasting message in #{name}: #{message.content}"
      @users.each do |user|
        user.acknowledge_message(self, message)
      end
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
  
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  # Example usage
  if __FILE__ == $0
    user1 = User.new("Alice", "alice@example.com", "password123")
    user2 = User.new("Bob", "bob@example.com", "securepassword")
  
    room1 = Room.new("General Chat", "A place for general discussions.")
# add a method to user so, user can enter to a room
# user.enter_room(room)
    user1.enter_room(room1)
    user2.enter_room(room1)
# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)  
    user1.send_message(room1, "Hello everyone!")
    user2.send_message(room1, "Hi Alice!")
  end
  