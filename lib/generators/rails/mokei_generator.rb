module Rails
  module Generators
    class MokeiGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../../templates", __FILE__)

      desc <<DESC
Description:
    Create builder files for model.
DESC

      hook_for :test_framework
    end
  end
end
