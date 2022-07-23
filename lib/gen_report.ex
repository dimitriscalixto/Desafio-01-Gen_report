defmodule GenReport do
  alias GenReport.Parser
  @months [
    "janeiro",
    "fevereiro",
    "março",
    "abril",
    "maio",
    "junho",
    "julho",
    "agosto",
    "setembro",
    "outubro",
    "novembro",
    "dezembro"
  ]

  @names [
    "daniele",
    "mayk",
    "giuliano",
    "cleiton",
    "jakeliny",
    "joseph",
    "diego",
    "rafael",
    "vinicius",
    "danilo"
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report ->
      get_hours(line, report)
    end)
  end

  defp get_hours([name, hours, _day, month, year], %{
    "all_hours" => all_hours,
    "hours_per_month" => hours_per_month,
    "hours_per_year" => hours_per_year
  }) do
all_hours = Map.put(all_hours, name, all_hours[name] + hours)
hours_per_month = sum_values(hours_per_month, name, month, hours) # %{ "hours_per_month" => %{ name => %{"date" => value}}}
hours_per_year = sum_values(hours_per_year, name, year, hours)

%{
 "all_hours" => all_hours,
 "hours_per_month" => hours_per_month,
 "hours_per_year" => hours_per_year
}
end

  defp sum_values(map, name, date, hours) do
    Map.put(
      map,
      name,
      Map.put(map[name], date, map[name][date] + hours)
    )
  end

  def report_acc do
    months = Enum.into(@months, %{}, &{&1, 0})
    years = Enum.into(2016..2020, %{}, &{&1, 0})

    %{"all_hours" => %{}, "hours_per_month" => %{}, "hours_per_year" => %{}}
    |> Map.put("all_hours", gen_name(0))
    |> Map.put("hours_per_month", gen_name(months)) #Map.put("hours_per_year", gen_name(months))
    |> Map.put("hours_per_year", gen_name(years))
  end

  def gen_name(value) do
    Enum.into(@names, %{}, &{&1, value})
  end
end
