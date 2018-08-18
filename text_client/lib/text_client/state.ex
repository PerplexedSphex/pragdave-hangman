defmodule TextClient.State do
  # whenever you need to package state, I reccomend a struct
  defstruct(
    game_service: nil, 
    tally:        nil,
    guess:      ""
  )
end