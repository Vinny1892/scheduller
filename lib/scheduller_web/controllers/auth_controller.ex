defmodule SchedullerWeb.AuthController do
  use SchedullerWeb, :controller

  action_fallback SchedullerWeb.FallbackController

  def login(conn, _params) do
    {:ok, token, _claims} =
      Scheduller.Guardian.encode_and_sign(%{id: "4e07d444-e97e-4dbe-8caf-8ed9a1e0d9fa" ,email: "vinnyaoe@gmail.com", name: "teste"})
    conn
    |> put_status(:ok)
    |> render(SchedullerWeb.AuthView, access_token: token)


  end

  def decode(conn, _params) do
    token = Scheduller.Guardian.Plug.current_token(conn)

     {:ok, %{ "sub" => data }} = Scheduller.Guardian.decode_and_verify(token)
    conn
    |> put_status(:ok)
    |> render("profile.json", data: data)

  end

end
