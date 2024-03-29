defmodule DataNoms.DataSource do
  use DataNoms.Web, :model

  schema "data_sources" do
    field :name, :string
    field :url, :string
    field :format_type, :string

    timestamps
  end

  @required_fields ~w(name url format_type)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
