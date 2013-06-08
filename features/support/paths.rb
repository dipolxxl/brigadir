module NavigationHelpers
  def path_to(page_name)
    case page_name

    when 'the list of brigades'
      # '/brigades'
      brigades_path

    else
      raise "Can't find routes for \"#{page_name}\"."
    end
  end
end

World(NavigationHelpers)
