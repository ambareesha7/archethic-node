defmodule Mix.Tasks.Uniris.CleanDb do
  @moduledoc "Drop all the data from the database"

  use Mix.Task

  def run(_) do
    {:ok, _started} = Application.ensure_all_started(:xandra)
    {:ok, conn} = Xandra.start_link()
    Xandra.execute!(conn, "DROP KEYSPACE IF EXISTS uniris;")
    IO.puts("Database dropped")
  end
end
