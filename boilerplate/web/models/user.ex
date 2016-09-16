defmodule Boilerplate.User do
  use Boilerplate.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :password_hash, :string
    field :status, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:first_name, :last_name, :username, :email, :password_hash, :status])
    |> validate_required([:first_name, :last_name, :username, :email, :password_hash, :status])
  end
end
