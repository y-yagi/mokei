module Mokei
  class << self
    attr_accessor :builder_paths
  end

  self.builder_paths = %w(builders test/builders)

  def self.load_builders!
    absolute_builder_paths = builder_paths.map { |path| File.expand_path(path) }

    absolute_builder_paths.uniq.each do |path|
      load("#{path}.rb") if File.exist?("#{path}.rb")

      if File.directory? path
        Dir[File.join(path, '**', '*.rb')].sort.each { |file| load file }
      end
    end
  end
end
