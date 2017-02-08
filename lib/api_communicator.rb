require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  character_name = "han solo"
  url = 'http://www.swapi.co/api/people/'
  all_characters = []
  begin
    characters_raw = RestClient.get(url).body
    result = JSON.parse(characters_raw)
    all_characters += result["results"]
    url = result["next"]
  end while url
  # look up the character and stop when you find it
  found_character = all_characters.find do |character|
    name = character["name"]
    name.downcase == character_name
  end
  binding.pry

end

def parse_character_movies(films_hash)
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
