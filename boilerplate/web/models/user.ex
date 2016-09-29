defmodule Boilerplate.User do
  use Boilerplate.Web, :model

  schema "users" do
    field :first_name, :string
    field :last_name, :string
    field :username, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :status, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ :empty) do
    struct
    |> cast(params, [:username, :email, :password_hash, :status], [:first_name, :last_name])
    # |> validate_required([:first_name, :last_name, :username, :email, :password_hash, :status])
  end

  def registration_changeset(struct, params) do
    struct
    |> changeset(params)
    |> validate_length(:password, min: 6)
  end
end
