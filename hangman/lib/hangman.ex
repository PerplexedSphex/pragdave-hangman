defmodule Hangman do

  alias Hangman.Game

  defdelegate new_game(),             to: Game
  defdelegate tally(game),            to: Game

  # put the monad at the api level
  # tally returns %{ game_state:, turns_left:, letters: }
  
  def make_move(game, guess) do
    game = Game.make_move(game, guess)
    { game, tally(game) }
  end

end
