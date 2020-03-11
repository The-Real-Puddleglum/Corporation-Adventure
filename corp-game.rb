class MudServer::DefaultController
  def on_start
    puts "Welcome! Here's a list of available commands"
    puts "TIME  : See the current time."
    puts "NORTH : Go north"
    puts "SOUTH : Go south"
    puts "EAST  : Go east"
    puts "WEST  : Go west"
    puts "UP    : Go up if possible"
    puts "DOWN  : Go down if possible"
    puts "EXAMINE: look around current room"
    puts "GRAB  : pick up item (requires target item name)"
    puts "COMMANDS: view list of commands"
    puts "QUIT  : Exit the game."
  end
end

class Foyer < MudServer::AbstractController
  # For security, you must explicitly whitelist any commands that you want to
  # give players access to. Otherwise they will not be accessible by users.
  def allowed_methods
    super + ['time', 'north', 'south', 'east', 'west', 'examine', 'grab' 'commands'] # Quit is available by default via `super`                                                                       # No need to implement it yourself.
  end
  # User input after a command is provided via `params`.
  def on_start
    puts "There isn't anything that is out of the ordinary in this"
    puts "room. It's just your typical bussiness foyer, with a tall"
    puts "desk and a laminated floor. The secretaries behind the desk"
    puts "seem preoccupied; I don't think they would take kindly to interaction."
    puts "To the North lies the conference room. A conference is in progress."
    puts "To the South lies the Great Outdoors."
    puts "To the East lies the BreakRoom. It looks empty, as its only #{Time.now}"
    puts "To the West lies a long hallway with offices along it."
  end

  choice1 == $stdin.gets.chomp

  if choice1 == north
    return ConferenceRoom
  end

  if choice1 == south
    return Outside
  end

  if choice1 == east
    return BreakRoom
  end

  if choice1 == west
    return Hallway
  end

  if choice1 == examine
    puts "There isn't anything that is out of the ordinary in this"
    puts "room. It's just your typical bussiness foyer, with a tall"
    puts "desk and a laminated floor. The secretaries behind the desk"
    puts "seem preoccupied; I don't think they would take kindly to interaction."
    puts "To the North lies the conference room. A conference is in progress."
    puts "To the South lies the Great Outdoors."
    puts "To the East lies the BreakRoom. It looks empty, as its only #{Time.now}"
    puts "To the West lies a long hallway with offices along it."
  end

  if choice1 == grab
    puts "There isn't anything to take."
    return Foyer
  end

  if choice1 == time
    puts "The current time is #{Time.now}"
  end

  if choice1 == commands
    puts "TIME  : See the current time."
    puts "NORTH : Go north"
    puts "SOUTH : Go south"
    puts "EAST  : Go east"
    puts "WEST  : Go west"
    puts "EXAMINE: look around current room."
    puts "GRAB  : pick up item (requires target item name)"
    puts "COMMANDS: view this list of commands."
    puts "QUIT  : Exit the game."
  end
end

class ConferenceRoom < MudServer::AbstractController
  def on_start
    puts "You walk into a conference that is in progress."
    puts "The attendees look at you curiously."
    puts "To the north there is a large French Window"
    puts "The east and west are impassable to to large walls"
  end
  choice3 = $stdin.gets.chomp
  def allowed_methods
    super + ['quit', 'time', 'north', 'south', 'east', 'west', 'examine', 'grab', 'commands']
  end
  if choice3 == 'time'
    puts "The current time is #{Time.now}."
  end

  if choice3 == 'north'
    puts "You jump over the table and crash through the window."
    puts "You are now in the landscaping, next to a busy street."
    return 'Landscaping'
  end

  if choice3 == 'south'
    puts "You slip out of the room, profusely apologizing for interupting."
    return 'Foyer'
  end

  if choice3 == 'east'
    puts "You cannot go east."
    return 'ConferenceRoom'
  end

  if choice3 == 'west'
    puts "You cannot go east"
    return 'ConferenceRoom'
  end

  if choice3 == 'examine'
    puts "There are coffee cups and notepads lying on the table."
    puts "There is a large French Window to the north"
    puts "And two thick walls to the east and west"
    puts "You can go south to go back to the foyer."
    return 'ConferenceRoom'
  end

  if choice3 == 'grab' #  ! ADD TO INVENTORY
    return 'ConferenceRoom'
  end

  if choice3 == 'commands'
    puts "TIME  : See the current time."
    puts "NORTH : Go north"
    puts "SOUTH : Go south"
    puts "EAST  : Go east"
    puts "WEST  : Go west"
    puts "EXAMINE: look around current room."
    puts "GRAB  : pick up item (requires target item name)"
    puts "COMMANDS: view this list of commands."
    puts "QUIT  : Exit the game."
    return 'ConferenceRoom'
  end

  # !    if choice3 == 'throw'
  #  ! Inventory stuff
  # !    end
end

class BreakRoom < MudServer::AbstractController
  def on_start
    puts "You enter the company's break room."
    puts "Its currently #{Time.now}, so the room"
    puts "Is empty. There's some food and coffee,"
    puts "but at first glance nothing else."
    puts "There are no doors except the one leading back."
  end

  choice4 = $stdin.gets.chomp
  def allowed_methods
    super + ['quit', 'time', 'north', 'south', 'east', 'west', 'examine', 'grab', 'commands', 'down']
  end

  if choice4 == 'time'
    puts "The current time is #{Time.now}."
    return 'BreakRoom'
  end

  if choice4 == 'north'
    puts "This direction is impassable."
    return 'BreakRoom'
  end

  if choice4 == 'south'
    puts "This direction is impassable."
    return 'BreakRoom'
  end

  if choice4 == 'east'
    puts "This direction is impassable."
    return 'BreakRoom'
  end

  if choice4 == 'west'
    return 'Foyer'
  end

  if choice4 == 'examine'
    puts "There is a tiny staircase leading downwards in a corner."
    return 'BreakRoom'
  end

  if choice4 == 'grab'
    puts "What do you want to take?" # ! implement inventory!
  end

  if choice4 == 'commands'
    puts "TIME  : See the current time."
    puts "NORTH : Go north"
    puts "SOUTH : Go south"
    puts "EAST  : Go east"
    puts "WEST  : Go west"
    puts "UP    : Go up if possible"
    puts "DOWN  : Go down if possible"
    puts "EXAMINE: look around current room"
    puts "GRAB  : pick up item (requires target item name)"
    puts "COMMANDS: view list of commands"
    puts "QUIT  : Exit the game."
    return 'BreakRoom'
  end

  if choice4 == 'down'
    return "BombShelter"
  end
end

class Hallway < MudServer::AbstractController
  def on_start
    puts "You walk down a very long hallway."
    puts "The hallway extends farther west,"
    puts "There is an office to the north."
    puts "There is a locked janitor closet east."
    puts "There is the foyer back east."
  end

  choice4 = $stdin.gets.chomp

  def allowed_methods
    super + ['time', 'north', 'south', 'east', 'west', 'examine', 'grab', 'commands', 'quit', 'yes', 'no']
  end

  if choice4 == 'time'
    puts "The time is now #{Time.now}"
    return 'Hallway'
  end

  if choice4 == 'north'
    puts "You throw open the office door."
    puts "The person working at the computer doesn't"
    puts "recognize you. He yells for a while, then walks"
    puts "up and punches you in the face. You black out."
    return 'Death'
  end

  if choice4 == 'south'
    puts "There is a code you need to enter to unlock the closet."
    puts "Its only two factors, so you should be able to get it."
    puts "Would you like to continue?"
    continue = $stdin.gets.chomp

    if continue = 'yes'
      code = rand(1..1000)
      puts "[keypad]> "
      guess = gets.to_i
      while guess != code
          puts "ERROR. INCORRECT VALUE."
          guess = gets.to_i
      end
      if guess == code
          puts "The door unlocks and you enter the room."
          puts "Its empty though. The janitor is out with all"
          puts "his stuff, so the room is left bare"
          return 'Hallway'
      end
    elsif continue != 'yes'
      puts "Either you said no, or we couldn't understand your"
      puts "answer. Either way, we are returning you to previous"
      puts "known position."
      return 'Hallway'
    end
  end

  if choice4 == 'east'
    return 'Foyer'
  end

  if choice4 == 'west'
    return 'HallwayTwo'
  end

  if choice4 == 'examine'
    puts "North -- An unlocked office door."
    puts "South -- A locked Janitor Closet."
    puts "East  -- Back to the Foyer."
    puts "West  -- More hallway."
    puts "Besides this, its a boring, average hall."
    return 'Hallway'
  end

  if choice4 == 'grab' # ! implent inventory
  end

  if choice4 == 'commands'
    puts "TIME  : See the current time."
    puts "NORTH : Go north"
    puts "SOUTH : Go south"
    puts "EAST  : Go east"
    puts "WEST  : Go west"
    puts "UP    : Go up if possible"
    puts "DOWN  : Go down if possible"
    puts "EXAMINE: look around current room"
    puts "GRAB  : pick up item (requires target item name)"
    puts "COMMANDS: view list of commands"
    puts "QUIT  : Exit the game."
    return 'Hallway'
  end
  else
    puts "We can't understand this answer. Sorry."
    return 'Hallway'
  end
end

class Outside < MudServer::AbstractController
  def on_start
    puts "You walk outside the building,"
    puts "however its rush hour so you can't"
    puts "manage to get anywhere."
  end
  def allowed_methods
    super + ['time', 'north', 'south', 'east', 'west', 'examine', 'commands', 'quit']
  end
  choice5 = $stdin.gets.chomp

  if choice5 == 'time'
    puts "The time is currently #{Time.now}"
    return 'Outside'
  end

  if choice5 == 'north'
    return 'Foyer'
  end

  if choice5 == 'south'
    puts "This direction is impassable."
    return 'Outside'
  end

  if choice5 == 'east'
    puts "This direction is impassable."
    return 'Outside'
  end

  if choice5 == 'west'
    puts "This direction is impassable."
    return 'Outside'
  end

  if choice5 == 'examine'
    puts "The only way you can go and the only direction"
    puts "you can see is north, to the foyer."
    return 'Outside'
  end

  if choice5 == 'commmands'
    puts "TIME  : See the current time."
    puts "NORTH : Go north"
    puts "SOUTH : Go south"
    puts "EAST  : Go east"
    puts "WEST  : Go west"
    puts "EXAMINE: look around current room"
    puts "COMMANDS: view list of commands"
    puts "QUIT  : Exit the game."
    return 'Outside'
  end
end

class
    def secret
      return SpeakEasyRoom # Define the PokerRoom as a controller.
    end
  end

  # An example of another controller / sub-game / menu.
  class SpeakEasyRoom < MudServer::AbstractController # controllers are inherited.
    def on_start
      puts 'You found the secret speakeasy!'
      puts 'Type DEAL to get a hand of cards.'
      puts "Type DRINK to get a beer."
    end
    choice2 = $stdin.gets.chomp
    def allowed_methods
      ['quit', 'deal', 'drink']
    end
    if choice2 == 'deal'
      puts 'Did I say poker? I meant dice.'
      puts "You rolled a #{rand(5)+1}."
    end
    drunk_level = 0
    if choice2 == 'drink'
      puts "You grab a beer and begin drinking"
      drunk_level += 1
    end
    if drunk_level >= 3
      puts "You are now drunk. Despite your state"
      puts "You keep drinking and eventually die of"
      puts "alcohol overuse."
      return 'Death'

    end

    server = MudServer.new '0.0.0.0', '4321' # Run server on all IPs on port 4321.
    # Defaults to 0.0.0.0:4000 if none set.
    server.start # Accept connections

    puts 'Press enter to exit.'

    server.stop if gets.chomp
    © 2020 GitHub, Inc.