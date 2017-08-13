require "rails"

module Mokei
  class Railtie < Rails::Railtie
    initializer "mokei.set_builder_paths" do
      Mokei.builder_paths = [
        Rails.root.join("builders"),
        Rails.root.join("test", "builders")
      ]
    end

    config.after_initialize do
      Mokei.load_builders!
    end
  end
end
