# frozen_string_literal: true

module BetterItem
  class Conjured < Base
    def update
      decrease_sell_in
      decreas_quality if quality_positive?
      decreas_quality if quality_positive?
    end
  end
end
