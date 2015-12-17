module Bodogem
  module Game
    class Dominion < Base
      def self.title
        'ドミニオン'.freeze
      end

      def initialize
        @players = []
        setting_client
      end

      def start
      end
    end
  end
end
