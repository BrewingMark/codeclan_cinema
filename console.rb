require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

customer1 = Customer.new({'name' => 'Joe Blogs', 'cash' => 120.00})
# customer1.save()
customer2 = Customer.new({'name' => 'Steve Smith', 'cash' => 100.00})
# customer2.save()

binding.pry
nil
