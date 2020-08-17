class GamesController < ApplicationController
  def new
    @letters = []
    10.times { @letters << ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters].split(',')
    @word = params[:word]

    word_check = helpers.check_dictionary(@word)
    @result = "Congratulations! #{@word} is a valid English word!"
    word_letters = @word.upcase.chars
    @result = "Sorry but #{@word} can't be buit out of #{@letters}" unless word_letters.all? { |l| @letters.count(l) >= word_letters.count(l) }
    @result = "Sorry but #{@word} does not seem to be a valid English word" unless word_check['found']
  end
end
