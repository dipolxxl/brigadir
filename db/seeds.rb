# encoding: utf-8
#
# Автозаполнение таблицы с странами
#
#

if Country.exists?
  puts "Список стран не пустой!"
  exit
end

countries = %w(австрия беларусь венгрия гавайи италия мексика россия)
countries.each do | country_name |
  Country.create! name: country_name  
end
puts 'Создан новый список стран.'
