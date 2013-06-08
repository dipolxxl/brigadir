module BrigadesHelper
  def countries_for_select
    Country.all.collect{ |country| [country.name, country.id] }
  end

  def brigade_country brigade
    brigade.country.name.mb_chars.capitalize
  end
end
