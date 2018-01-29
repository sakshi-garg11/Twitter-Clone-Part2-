defmodule Project4.LoginController do
  use Project4.Web, :controller

  def login(conn, %{"username"=>username,"pass" =>pass}) do
    case :ets.lookup(:register, username) do 
      []->json conn, %{status: "User not registered "}
      [{_,passw}]->case :ets.lookup(:login, username) do
                   []->       cond do 
                                    passw===pass-> :ets.insert(:login, {username, pass,[]})
                                            json conn, %{status: "Login successful"}
                                      true->json conn, %{status: "Invalid password"}
                                  end
                   _->json conn, %{status: "User Already Logged in"}               
                 end

    end
  end

  def login(conn, param) do
    json conn, %{status: "Login unsuccessful"}
  end
end
