module BrigadesHelper
  include ActsAsTaggableOn::TagsHelper

  def countries_for_select
    Country.all.collect do |country|
      [country.name.mb_chars.capitalize, country.id]
    end
  end

  def brigade_country brigade
    brigade.country.name.mb_chars.capitalize
  end

  def list_of_tags brigade
    brigade.tag_list.map{ |t| link_to t, tag_path(t) }.join(', ')
  end

  def smart_link_for_tag
    link_arr = []
    Brigade.tag_counts.each do |t|
      link_arr << link_to((t.name + ' x ' + Brigade.tagged_with(t.name).count.to_s),
        tag_path(t.name))
    end

    link_arr.join('&nbsp;&nbsp;')
  end
end
