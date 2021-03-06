defmodule Discuss2Web.Router do
  use Discuss2Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Discuss2.Plugs.SetUser
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss2Web do
    pipe_through :browser

    # get "/", PageController, :index
    # get "/topics/new", TopicController, :new
    resources "/", TopicController
  end

  scope "/auth", Discuss2Web do
    pipe_through :browser

    get "/signout", AuthController, :signout
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end
  # Other scopes may use custom stacks.
  # scope "/api", Discuss2Web do
  #   pipe_through :api
  # end
end
