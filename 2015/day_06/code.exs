defmodule Command do
  @command_regex ~r/(turn on|turn off|toggle) (\d+),(\d+) through (\d+),(\d+)/
  @atoms [:turn_on, :turn_off, :toggle]

  defstruct [command: :turn_on, start_at: {0, 0}, finish_at: {0, 0}]

  def new, do: %Command{}
  def new([command, x1, y1, x2, y2]) do
    %Command{
      command:   command |> String.replace(" ", "_") |> String.to_existing_atom,
      start_at:  {to_int(x1), to_int(y1)},
      finish_at: {to_int(x2), to_int(y2)}
    }
  end

  def parse(command) do
    case Regex.scan(@command_regex, command) do
      [[_ | results]] -> Command.new(results)
      _               -> {:error, "invalid command: #{command}"}
    end
  end

  defp to_int(string), do: String.to_integer(string)
end

defmodule Decoration do
  def new, do: for x <- 0..999, y <- 0..999, do: {x, y}
end