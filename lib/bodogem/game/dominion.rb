require 'singleton'

module Bodogem
  module Game
    class Dominion
      def self.title
        'ドミニオン'.freeze
      end

      def initialize
        @supply = Supply.new
        @trash = []
        @player = Player.new('あなた')
        @turn = 0
      end

      def start
        round_start
      end

      def round_start
        @turn += 1
        Application.client.puts "@#{@player.name} さん: #{@turn}ターン目の開始です。"
      end
    end

    class Supply
    end

    class Player
      attr_reader :name

      def initialize(name)
        @name = name
        @discard_cards = []
        @stack_cards = []
        @hand_cards = []
        @play_cards = []
      end
    end
  end

  Application.packages << Game::Dominion
end
