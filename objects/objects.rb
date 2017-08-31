class Product
  attr_accessor :name, :price, :weight

  #se pone un hash para que el me tome los parametros y no tenga que agregar 0
  def initialize(opts = {})
    @name = opts[:name] ? opts[:name] : "NN"
    @price = opts[:price] ? opts[:price] : 0
    @weight = opts[:weight] ? opts[:weight] : 0
  end

end

product = Product.new()
puts product
puts product.class
puts product.name
puts product.price
puts product.weight

# product2 = Product.new("orange", 50)
# puts product2
# puts product2.class
# puts product2.name
# puts product2.price
#
# product3 = Product.new("gafas", 0)
# puts product3
# puts product3.class
# puts product3.name
# puts product3.price
#
# product4 = Product.new("", 0, 0)
# puts product4
# puts product4.class
# puts product4.name
# puts product4.price
# puts product4.weight
#
# product5 = Product.new("mora", 0, 900)
# puts product5
# puts product5.class
# puts product5.name
# puts product5.price
# puts product5.weight
