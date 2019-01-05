# frozen_string_literal: true

module BetterItem
  class AgedCheese < Base
    def update
      decrease_sell_in
      increase_quality if can_increase_quality?
    end
  end
end
