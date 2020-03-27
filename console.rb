require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

customer1 = Customer.new({'name' => 'Joe Blogs', 'cash' => 120.00})
# customer1.save()
customer2 = Customer.new({'name' => 'Steve Smith', 'cash' => 100.00})
# customer2.save()


film1 = Film.new({'title' => 'The Matrix', 'price' => 10})
# film1.save()
film2 = Film.new({'title' => 'Into The Wild', 'price' => 10})
# film2.save()

binding.pry
nil
