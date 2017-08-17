module Rspec
  class MokeiGenerator < ::Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def create_builder_file
      template "builder.rb", File.join("test/builders", class_path, "#{file_name}_builder.rb")
    end
  end
end
