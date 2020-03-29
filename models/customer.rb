require_relative('../db/sql_runner')

class Customer

  attr_accessor :name
  attr_reader :cash, :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @cash = options['cash'].to_f
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      cash
    )
    VALUES
    (
      $1,
      $2
    )
    RETURNING id"
    values = [@name, @cash]
    customer = SqlRunner.run(sql, values).first
    @id = customer['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql, [])
    return customers.map {|customer_hash| Customer.new(customer_hash)}
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql, [])
  end

  def update()
    sql = "UPDATE customers SET
    (
      name,
      cash
    ) =
    (
      $1,
      $2
    )
    WHERE id = $3"
    values = [@name, @cash, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT DISTINCT title FROM films
          INNER JOIN tickets
          on films.id = tickets.film_id
          WHERE customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map {|film| Film.new(film)}
  end

  def total_tickets_bought()
    sql = "SELECT count(*) FROM tickets
          INNER JOIN customers
          ON customers.id = tickets.customer_id
          WHERE customers.id = $1"
    values = [@id]
    total = SqlRunner.run(sql, values)
    return total[0]['count'].to_i()
  end
  # pretty much copied from an example, don't really understan the last line.

  def buy_ticket()

  end
  # this should reduce customer funds by the film.price. should it also save a
  # new ticket - how would thwt work? would I have to pass in a film?

end
