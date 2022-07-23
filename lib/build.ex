defmodule Report do
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


  def build() do

        months = Enum.into(@months, %{}, &{&1,0})
        years = Enum.into(2016..2020, %{}, &{&1,0})
        all_hours = name_gen(0)
        hours_per_month = name_gen(months)
        hours_per_year = name_gen(years)
        %{
          "all_hours" => all_hours,
          "hours_per_month" => hours_per_month,
          "hours_per_year" => hours_per_year
        }
    end

    def name_gen(value) do
      Enum.into(@names, %{}, &{&1,value})
    end
end
