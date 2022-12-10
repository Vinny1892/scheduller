defmodule SchedullerWeb.AuthControllerTest do
  use SchedullerWeb.ConnCase
  import Scheduller.Guardian

 test "GET /decode", %{conn: conn} do
    data = %{id: "4e07d444-e97e-4dbe-8caf-8ed9a1e0d9fa" ,email: "vinnyaoe@gmail.com", name: "teste"}
    {:ok, token, _} = encode_and_sign(data, %{}, token_type: :access)

    conn = conn
    |> put_req_header("authorization", "Bearer " <> token)
    |> get(Routes.auth_path(conn,:decode))

    data_expected = %{"id" => "4e07d444-e97e-4dbe-8caf-8ed9a1e0d9fa", "email" => "vinnyaoe@gmail.com" , "name" => "teste"}
    assert json_response(conn,200) == %{ "data" => data_expected }
    # Assert things here
  end


  test "POST /login", %{conn: conn} do
    conn = conn
    |> post(Routes.auth_path(conn,:login))
    response = json_response(conn,200)
    %{"data" => token } = response
    keys = Map.keys(token)
    assert token["access_token"] !== ""
    assert keys == ["access_token"]
  end

end
