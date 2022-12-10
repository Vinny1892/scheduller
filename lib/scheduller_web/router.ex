defmodule SchedullerWeb.Router do
  use SchedullerWeb, :router

  pipeline :auth do
    plug  SchedullerWeb.Auth.Pipeline
  end
  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SchedullerWeb do
    pipe_through :api

    post "/login" , AuthController, :login



  end

  scope "/", SchedullerWeb do
    pipe_through [:api, :auth]

    # Authenticate resource
    #get "/protected", PageController, :protected
    get "/decode" , AuthController, :decode


  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
