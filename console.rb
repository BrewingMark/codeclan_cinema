require('pry-byebug')
require_relative('models/customer')
require_relative('models/film')
require_relative('models/ticket')

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()


customer1 = Customer.new({'name' => 'Joe Blogs', 'cash' => 120})
customer1.save()
customer2 = Customer.new({'name' => 'Steve Smith', 'cash' => 100})
customer2.save()

film1 = Film.new({'title' => 'The Matrix', 'price' => 10})
film1.save()
film2 = Film.new({'title' => 'Into The Wild', 'price' => 10})
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film2.id})
ticket4.save()

binding.pry
nil
