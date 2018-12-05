defmodule Day2 do
  @moduledoc """
  Documentation for Day2.
  """

  def get_checksum do
    char_maps = 
      read_lines
      |> Enum.map(&line_to_char_map/1)


    two_occurs = Enum.filter(char_maps, fn char_map -> has_count?(char_map, 2) end) 
    three_occurs = Enum.filter(char_maps, fn char_map -> has_count?(char_map, 3) end) 

    IO.inspect(Enum.count(two_occurs) * Enum.count(three_occurs))
  end

  def read_lines() do
    File.stream!("input.txt") 
    |> Enum.map(fn line -> String.trim(line) end)
  end

  def line_to_char_map(line) do
    String.graphemes(line)
    |> Enum.reduce(%{}, fn char, acc -> 
        Map.update(acc, char, 1, fn val -> val + 1 end) end)    
  end

  def has_count?(char_map, count) do
    Enum.any?(char_map, fn {k,v} -> v == count end)
  end

end
