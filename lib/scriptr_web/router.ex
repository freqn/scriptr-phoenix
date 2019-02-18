defmodule ScriptrWeb.Router do
  use ScriptrWeb, :router

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

  scope "/", ScriptrWeb do
    pipe_through :browser

    resources "/pharmacies", PharmacyController
    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
    delete "/sign-out", SessionController, :delete

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", ScriptrWeb do
  #   pipe_through :api
  # end
end
