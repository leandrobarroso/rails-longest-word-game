class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split(',')
    @word = params[:word]

    word_check = check_dictionary(@word)
    @result = "Congratulations! #{@word.upcase} is a valid English word!"
    word_letters = @word.upcase.chars
    unless word_letters.all? { |l| @letters.count(l) >= word_letters.count(l) }
      @result = "Sorry but #{@word.upcase} can't be buit out of #{@letters.join(', ')}"
    end
    @result = "Sorry but #{@word.upcase} does not seem to be a valid English word" unless word_check['found']
  end

  def check_dictionary(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    response_serialized = open(url).read
    response = JSON.parse(response_serialized)
    response
  end
end
