defmodule Project4.RegisterController do
  use Project4.Web, :controller

  def register(conn, %{"username"=>username,"pass" =>pass}) do 
    case :ets.lookup(:register, username) do 
      []->:ets.insert(:register, {username, pass})
         json conn, %{status: "Registration successful "}
      _->
        json conn, %{status: "User already exist."}
    end
  end

  def register(conn, param) do
    json conn, %{status: "Register unsuccessful"}
  end
end
