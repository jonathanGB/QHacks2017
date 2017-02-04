defmodule App.JonatainVariableController do
	use App.Web, :controller

	def index(conn, params) do
		render conn, "index.html", name: params["name"]
	end
end
