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
        target_class = determine_target(self.class.to_s)
        @target = target_class.new
      end

      def build
        target
      end

      def create!
        raise NotImplementedError unless target.respond_to?(:save!)

        target.save!
        target
      end

      private

      def determine_target(class_name)
        class_name.sub!(/Builder$/, "").constantize
      end
    end
  end
end
