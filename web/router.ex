defmodule Project4.Router do
  use Project4.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Project4 do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/user/:username/login", LoginController, :login
    get "/user/:username/register", RegisterController, :register
    get "/user/:username/tweet", TweetController, :tweet
    get "/user/:username/logout", LogoutController, :logout
    get "/user/:username/getallusers", UserController, :users
    get "/user/:username/findmention", FetchmentionController, :get
    get "/user/:username/findtag", FetchtagController, :get
  end

  # Other scopes may use custom stacks.
  # scope "/api", Project4 do
  #   pipe_through :api
  # end
end
