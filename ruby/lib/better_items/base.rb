# frozen_string_literal: true

module BetterItem
  class Base
    def initialize(item)
      @item = item
    end

    # Factory
    def self.get(item)
      case item.name
      when 'Aged Brie'
        AgedCheese.new(item)
      when 'Sulfuras, Hand of Ragnaros'
        Sulfuras.new(item)
      when 'Backstage passes to a TAFKAL80ETC concert'
        BackstagePasses.new(item)
      when 'Conjured item'
        Conjured.new(item)
      else
        new(item)
      end
    end

    def update
      decrease_sell_in
      decreas_quality if quality_positive?
      decreas_quality if quality_positive? && sell_in_negative?
    end

    protected

    def quality_positive?
      @item.quality.positive?
    end

    def sell_in_negative?
      @item.sell_in.negative?
    end

    def can_increase_quality?
      @item.quality < 50
    end

    def decreas_quality
      @item.quality -= 1
    end

    def increase_quality
      @item.quality += 1
    end

    def decrease_sell_in
      @item.sell_in -= 1
    end
  end
end
