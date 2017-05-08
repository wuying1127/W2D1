# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  print "Invalid input. Please enter a number: "
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeInvalidError.new("I love coffee!")
  else
    raise NeitherFruitOrCoffeeError.new("Gross veggie!")
  end
end

class CoffeeInvalidError < StandardError
end

class NeitherFruitOrCoffeeError < StandardError
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
rescue CoffeeInvalidError => e
  puts e.message
  retry
end

# PHASE 4
class FriendshipError < StandardError
end

class ArgumentLengthError < StandardError
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    raise FriendshipError.new("We're not that close") if yrs_known < 5
    @fav_pastime = fav_pastime
    if name.length < 1 || fav_pastime.length < 1
      raise ArgumentLengthError.new("Please fill out all fields")
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
