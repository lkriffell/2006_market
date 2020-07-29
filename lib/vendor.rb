class Vendor

  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new { |hash, key| hash[key] = 0 }
  end

  def check_stock(item)
    if @inventory.include?(item)
      @inventory[item]
    else
      0
    end
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

  def potential_revenue
    all_revenues = []
    @inventory.each do |item|
      item[1].times do
        all_revenues << item[0].price[1..-1].to_f
      end
    end
    all_revenues.sum
  end
end
