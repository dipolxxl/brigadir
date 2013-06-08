#
# Настраиваем ActsAsTaggableOn
#
#
module Brigadir
  class Application < Rails::Application
    ActsAsTaggableOn.force_lowercase = true
    ActsAsTaggableOn.delimiter = ','
  end
end