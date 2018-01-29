defmodule Project4.UserController do
  use Project4.Web, :controller

  def users(conn, %{"username"=>username}) do
    users=:register
              |> :ets.tab2list
              |>Enum.reduce([], fn ({key, _}, acc) -> List.insert_at(acc,0,key) end)
    json conn, %{status: users}
  end

  def users(conn, param) do
    json conn, %{status: "Invalid query"}
  end
end
