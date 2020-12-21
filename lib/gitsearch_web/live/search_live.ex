defmodule GitsearchWeb.SearchLive do
  use GitsearchWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_event("suggest", %{"q" => query}, socket) do
    {:noreply, assign(socket, results: search(query), query: query)}
  end

  defp search(""), do: []
  defp search(query) do
    HTTPoison.get!(
      "https://api.github.com/search/repositories",
      [],
      params: %{q: query, sort: "stars", order: "desc", per_page: 10}
    ).body
    |> Poison.decode!()
    |> get_in(["items"])
    |> Enum.map(fn item -> item["full_name"] end)
  end
end
