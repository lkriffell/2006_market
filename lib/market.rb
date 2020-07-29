class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = []
    @vendors.each do |vendor|
      names << vendor.name
    end
    names
  end

  def vendors_that_sell(item)
    vendor_sells_this = []
    @vendors.each do |vendor|
      if vendor.inventory.include?(item)
        vendor_sells_this << vendor
      end
    end
    vendor_sells_this
  end

  def sorted_item_list
    sorted_items = []
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        sorted_items << item[0].name
      end
    end
    sorted_items.uniq.sort
  end
end
