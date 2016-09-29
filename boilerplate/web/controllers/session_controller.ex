defmodule Boilerplate.SessionController do
  use Boilerplate.Web, :controller

  def new(conn, _params) do
    render("new.html")
  end


end