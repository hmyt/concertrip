defmodule Concertrip.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: Concertrip.Repo

  object :sticker do
    field :id, :id
    field :url, :string
    field :title, :string
  end

  input_object :sticker_input do
    field :url, non_null(:string)
    field :title, non_null(:string)
  end

  object :whiteboard do
    field :id, :id
    field :stickers, list_of(:sticker), resolve: assoc(:stickers)
  end

  object :room do
    field :id, :id
    field :name, :string
    field :whiteboard, :whiteboard, resolve: assoc(:whiteboard)
  end
end
