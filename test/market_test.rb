require "minitest/autorun"
require "minitest/pride"
require './lib/item'
require './lib/vendor'
require './lib/market'

class MarketTest < Minitest::Test

  def test_it_exists
    market = Market.new("South Pearl Street Farmers Market")
    assert_instance_of Market, market
  end

  def test_it_has_attributes
    market = Market.new("South Pearl Street Farmers Market")

    assert_equal "South Pearl Street Farmers Market", market.name
    assert_equal [], market.vendors
  end

  def test_add_vendor
    market = Market.new("South Pearl Street Farmers Market")
    vendor1 = Vendor.new("Rocky Mountain Fresh")
    vendor2 = Vendor.new("Ba-Nom-a-Nom")
    market.add_vendor(vendor1)
    market.add_vendor(vendor2)

    assert_equal [vendor1, vendor2], market.vendors
  end

end
