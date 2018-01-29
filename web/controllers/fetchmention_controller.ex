defmodule Project4.FetchmentionController do
  use Project4.Web, :controller

  def get(conn, %{"username"=>username,"find"=>find}) do 
    val= :ets.lookup(:mention, find) 
    tweets=
    cond do
      is_list(val)-> val |>Enum.reduce([], fn ({key, value}, acc) -> List.insert_at(acc,0,value) end)
      true->val
    end
   
    json conn, %{status: tweets}
  end

  def get(conn, param) do
    json conn, %{status: "Invalid query"}
  end
end
