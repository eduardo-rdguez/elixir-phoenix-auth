defmodule ElixirPhoenixAuth.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  import Argon2, only: [add_hash: 1]

  schema "users" do
    field :email, :string
    field :password_hash, :string

    # Virtual fields
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :password_confirmation])
    |> validate_required([:email, :password, :password_confirmation])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 8)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> put_password_hash
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        change(changeset, add_hash(pass))

      _ ->
        changeset
    end
  end
end
