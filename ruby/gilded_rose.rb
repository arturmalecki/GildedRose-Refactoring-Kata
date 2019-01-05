# frozen_string_literal: true

Dir['./lib/**/*.rb'].each { |file| require file }

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each { |item| BetterItem::Base.get(item).update }
  end
end
