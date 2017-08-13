require "tapper"
require "active_support"
require "active_support/inflector"

module Mokei
  module Builder
    class Base
      attr_reader :target

      class << self
        def inherited(child)
          child.include(Tapper)
        end
      end

      def initialize
        target = determine_target(self.class.to_s)
        @target = target.new if target && target != self.class
      end

      def build
        target
      end

      private

      def determine_target(class_name)
        names = class_name.split "::"
        while names.size > 0 do
          names.last.sub!(/Builder$/, "")
          begin
            constant = names.join("::").safe_constantize
            break(constant) if Class === constant
          ensure
            names.pop
          end
        end
      end
    end
  end
end
