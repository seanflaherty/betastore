#Create 50 Products
#Print Name and Price of the 3 most expensive products
#Print total number of products
#Print average price of products 

# Version that uses random number/string
# i = 0

# while i < 50  do
#   n = [*('A'..'Z')].sample(8).join
#   p = ((10 - 3.0) * rand() + 3).round(2)

#   p = Product.new(name: n, price: p)
#   p.save
#   i +=1
# end

# Version using Faker, still using random numbers.  
i = 0

while i < 50
  n = Faker::Commerce.product_name
  #c = ((10 - 3.0) * rand() + 3).round(2)
  c = Faker::Commerce.price
  p = Product.new(name: n, price: c)
  p.save
  i += 1
end 

products = []
products = Product.all.order('price desc').limit(3)
products.each{ |p| puts p.name, p.price }
puts "Number of Products: #{Product.all.count}"
puts "Average Price: $#{(Product.average(:price)).round(2)}"

