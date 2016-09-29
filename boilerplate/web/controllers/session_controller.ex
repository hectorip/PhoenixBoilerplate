defmodule Boilerplate.SessionController do
  use Boilerplate.Web, :controller

  def new(conn, _params) do
    render("new.html")
  end

  def create(conn, %{"session" => %{"username" => username, "password" => pass}}) do
    case Boilerplate.Auth.login_by_username_and_password(conn, username, pass, repo:Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |>redirect(to: page_path(conn, :index))
      {:error, _reason, conn}->
        conn
        |> put_flash(:error, "Bad user or password!")
        |>render("new.html")
    end
  end
end