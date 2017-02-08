def welcome
  puts "*" * 30
  puts "Welcome to the dopest star wars search thing evar"
  puts "*" * 30
end

def get_character_from_user
  puts "please enter a character"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end
