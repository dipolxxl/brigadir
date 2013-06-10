module BrigadesHelper
  def countries_for_select
    Country.all.collect do |country|
      [country.name.mb_chars.capitalize, country.id]
    end
  end

  def brigade_country brigade
    brigade.country.name.mb_chars.capitalize
  end
end
