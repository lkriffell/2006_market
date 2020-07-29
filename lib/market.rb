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

  def total_inventory
    total_items = Hash.new { |hash, key| hash[key] = {}}
    @vendors.each do |vendor|
      vendor.inventory.each do |item|
        total_item_num = 0
        total_items[item[0]][:quantity] = (total_item_num += item[1])
        total_items[item[0]][:vendors] = vendors_that_sell(item[0])
      end
    end
    total_items
  end

  def overstocked_items
    over_stock = []
    total_inventory.each do |item|
      if item[1][:vendors].size > 1 && item[1][:quantity] > 50
        over_stock << item[0]
      end
    end
    over_stock
  end
end
