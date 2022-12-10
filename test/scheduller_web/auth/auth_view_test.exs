
defmodule SchedullerWeb.AuthViewTest do
  use SchedullerWeb.ConnCase
  import Phoenix.View

 test "profile.json", %{conn: conn} do
  data_expected = %{"id" => "4e07d444-e97e-4dbe-8caf-8ed9a1e0d9fa", "email" => "vinnyaoe@gmail.com" , "name" => "teste"}
  assert render(SchedullerWeb.AuthView, "profile.json", [data: data_expected]) == %{data: data_expected}

 end



  test "login.json", %{conn: conn} do
    token = "token-jwt-teste"
    assert render(SchedullerWeb.AuthView, "login.json", [access_token: token ]) == %{data: %{ access_token: token}}
  end

end
