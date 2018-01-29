defmodule Project4.LogoutController do
  use Project4.Web, :controller

  def logout(conn, %{"username"=>username}) do
    case :ets.lookup(:login, username) do 
      []->json conn, %{status: "User not logged in "}
       _->:ets.delete(:login, username)
          json conn, %{status: "User successfully logged out"}               
    end
  end

  def logout(conn, param) do
    json conn, %{status: "Logout unsuccessful"}
  end
end
