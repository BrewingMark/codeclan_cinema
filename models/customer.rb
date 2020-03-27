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
    result = customers.map {|customer_hash| Customer.new(customer_hash)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql, [])
  end

  def update()
    sql = "UPDATE customers SET (
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

end
