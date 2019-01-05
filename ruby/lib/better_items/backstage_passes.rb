# frozen_string_literal: true

module BetterItem
  class BackstagePasses < Base
    def update
      decrease_sell_in
      increase_quality if can_increase_quality?
      increase_quality if can_increase_quality? && sell_in_first_term?
      increase_quality if can_increase_quality? && sell_in_second_term?
      nullify_quality if sell_in_negative?
    end

    private

    def sell_in_first_term?
      @item.sell_in < 11
    end

    def sell_in_second_term?
      @item.sell_in < 6
    end

    def nullify_quality
      @item.quality = 0
    end
  end
end
