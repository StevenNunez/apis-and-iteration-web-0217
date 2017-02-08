require 'rest-client'
require 'json'
require 'pry'

def get_all_characters
  url = 'http://www.swapi.co/api/people/'
  all_characters = []
  begin
    characters_raw = RestClient.get(url).body
    result = JSON.parse(characters_raw)
    all_characters += result["results"]
    url = result["next"]
  end while url
  all_characters
end

def find_character(characters, character_name)
  characters.find do |character|
    name = character["name"]
    name.downcase == character_name.downcase
  end
end

def find_films_for(character)
  film_urls = character["films"]
  film_urls.map do |film_url|
    result = RestClient.get(film_url).body
    JSON.parse(result)
  end
end
def get_character_movies_from_api(character_name)
  all_characters = get_all_characters
  found_character = find_character(all_characters, character_name)
  films = find_films_for(found_character)
  puts "#{found_character["name"]} has starred in the following movies:"
  films.each.with_index(1) do |film, index|
    puts "#{index}. #{film["title"]}"
  end
end

def parse_character_movies(films_hash)
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
