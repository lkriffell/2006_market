require "minitest/autorun"
require "minitest/pride"
require "./lib/vendor"
require "./lib/item"

class VendorTest < Minitest::Test

  def test_it_exists
    vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, vendor
  end

  #def test_it_has_attributes
  #end

end
