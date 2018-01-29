defmodule Project4.TweetController do
  use Project4.Web, :controller

  def tweet(conn, %{"username"=>username,"tweet" =>message}) do 
    case :ets.lookup(:login, username) do 
      []->json conn, %{status: "Invalid session "}
      _->:ets.insert(:tweet, {username, message})
      map=SocialParser.extract(message,[:hashtags,:mentions])
      Enum.map(Map.get(map,:hashtags,[]),fn(x)->
        IO.inspect "tag"
        IO.inspect x
        :ets.insert(:tag, {x, message})
      end)
      Enum.map(Map.get(map,:mentions,[]),fn(x)->  
        IO.inspect "mention"
        IO.inspect x
        :ets.insert(:mention, {x, message})          
      end)
        json conn, %{status: "Tweet: #{message}"}
    end
  end

  def tweet(conn, param) do
    json conn, %{status: "tweet unsuccessful"}
  end
end
