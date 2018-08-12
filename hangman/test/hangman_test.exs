defmodule HangmanTest do
  use ExUnit.Case
  doctest Hangman

  alias Hangman.Game

  test "new_game returns structure" do
    game = Game.new_game()
    assert game.turns_left == 7
    assert game.game_state == :initializing
  end

  test "state isn't changed for :won or :lost game" do
    for state <- [:won, :lost] do
      game = Game.new_game()
      |> Map.put(:game_state, :won)
      assert ^game = Game.make_move(game, 'x')
    end
  end

  test "first occurence of a letter is not already used" do
    game = Game.new_game()
    game = Game.make_move(game, 'x')
    assert game.game_state != :already_used
  end

  test "second occurence of a letter is already used" do
    game = Game.new_game()
    game = Game.make_move(game, "x")
    game = Game.make_move(game, "x")
    assert game.game_state == :already_used
  end

  test "a good guess is recognized" do
    game = Game.new_game("wibble")
    game = Game.make_move(game, "w")
    assert game.game_state == :good_guess
    assert game.turns_left == 7
  end

  test "a bad guess is recognized" do
    game = Game.new_game("wibble")
    game = Game.make_move(game, "x")
    assert game.game_state == :bad_guess
    assert game.turns_left == 6
  end
  

end
