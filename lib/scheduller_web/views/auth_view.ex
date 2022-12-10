defmodule SchedullerWeb.AuthView do
  use SchedullerWeb, :view


  def render("login.json", %{ access_token: access_token}) do
    %{data: %{access_token: access_token}}
  end

  def render("profile.json", %{ data: data }) do
    %{data: data}
  end

end
