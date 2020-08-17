require 'open-uri'
require 'json'

module GamesHelper
  def check_dictionary(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response_serialized = open(url).read
    response = JSON.parse(response_serialized)
    response
  end
end
