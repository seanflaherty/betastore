me = Customer.create(name: 'Jane Doe', email: 'sean@seanflaherty.net', password: 'password', type: 'Customer')
test = Customer.create(name: 'John Doe', email: 'test@example.com', password: 'password', type: 'Customer')
Customer.create(name: 'Nowhere Man', email: 'man@nowhere.com', password: 'password', type: 'Customer')

muffin = Product.create(name: 'Muffin', price: 2.99, image_url: 'http://upload.wikimedia.org/wikipedia/commons/8/8a/Muffin_NIH.jpg')
smoothie = Product.create(name: 'Smoothie', price: 3.75, image_url: 'http://upload.wikimedia.org/wikipedia/commons/5/5b/BlueberrySmoothie.png')
coffee = Product.create(name: 'Coffee', price: 3.99, image_url:  'http://upload.wikimedia.org/wikipedia/commons/4/45/A_small_cup_of_coffee.JPG')
Awesome_Concrete_Gloves = Product.create(name: 'Awesome Concrete Gloves', price: 5.36, image_url: 'http://i21.geccdn.net/site/images/n-picgroup/MEW_127-9680S.jpg')
Incredible_Cotton_Gloves = Product.create(name: 'Incredible Cotton Gloves', price: 6.21, image_url: 'http://ecx.images-amazon.com/images/I/31hjxcfoS6L.jpg')
Practical_Wooden_Shirt = Product.create(name: 'Practical Wooden Shirt', price: 5.54, image_url: 'http://upload.wikimedia.org/wikipedia/commons/0/01/Charvet_shirt.jpg')
Sleek_Steel_Shoes = Product.create(name: 'Sleek Steel Shoes', price: 9.21, image_url: 'http://upload.wikimedia.org/wikipedia/commons/e/e4/Steel-toe_boots.jpg')
Practical_Cotton_Hat = Product.create(name: 'Practical Cotton Hat', price: 9.67, image_url: 'http://upload.wikimedia.org/wikipedia/commons/2/23/Texas_Tech_Red_Raiders_baseball_cap.jpg')
Practical_Cotton_Car = Product.create(name: 'Practical Cotton Car', price: 7.64, image_url: 'http://upload.wikimedia.org/wikipedia/commons/c/c1/2011_Nissan_Leaf_WAS_2011_1040.JPG')
Incredible_Concrete_Table = Product.create(name: 'Incredible Concrete Table', price: 39.73, image_url: 'http://upload.wikimedia.org/wikipedia/commons/4/4a/2008-03-18RemshaldenBuochGrillplatz3377-01.jpg')
Fantastic_Plastic_Car = Product.create(name: 'CFantastic Plastic Car', price: 8.67, image_url: 'http://upload.wikimedia.org/wikipedia/commons/7/77/2011_Nissan_Leaf_SL_--_10-28-2011.jpg')

order = Order.create(customer: me, placed_at: '2013-09-27')
LineItem.create(order: order, quantity: 1, product: muffin)
LineItem.create(order: order, quantity: 1, product: smoothie)

order = Order.create(customer: me, placed_at: Time.current)
LineItem.create(order: order, quantity: 1, product: smoothie)

order = Order.create(customer: test, placed_at: Time.current)
LineItem.create(order: order, quantity: 1, product: muffin)
LineItem.create(order: order, quantity: 1, product: coffee)

User.create!(email: 'sean@seanflaherty.net', password: 'password', type: 'Customer')
User.create!(email: 'admin@seanflaherty.net', password: 'password', type: 'Administrator')
