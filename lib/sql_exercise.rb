require "database_connection"

class SqlExercise

  attr_reader :database_connection

  def initialize
    @database_connection = DatabaseConnection.new
  end

  def all_customers
    database_connection.sql("SELECT * from customers;")
  end

  def limit_customers(number)
    database_connection.sql("SELECT * FROM customers LIMIT #{number};")
  end

  def order_customers(arg)
    database_connection.sql("SELECT * FROM customers ORDER BY name #{arg};")
  end

  def id_and_name_for_customers
    database_connection.sql("SELECT id, name FROM customers;")
  end

  def all_items
    database_connection.sql("SELECT * FROM items;")
  end

  def find_item_by_name(arg)
    database_connection.sql("SELECT * FROM items WHERE name = '#{arg}';").first
  end

  def count_customers
    database_connection.sql("SELECT * from customers;").count
  end

  def sum_order_amounts
    database_connection.sql("SELECT SUM(amount) FROM orders;").first["sum"].to_f
  end

  def minimum_order_amount_for_customers
    database_connection.sql("SELECT MIN(amount), customer_id FROM orders GROUP BY customer_id;")
  end

  def customer_order_totals
    var = <<-SQL
    SELECT customers.id as customer_id, name, SUM(amount)
    FROM orders
    JOIN customers ON orders.customer_id = customers.id
    GROUP BY customers.id;
    SQL
    database_connection.sql(var)
  end

  def items_ordered_by_user(arg)
    var = <<-SQL
    SELECT items.name
    FROM orders
    JOIN orderitems ON orders.id = orderitems.order_id
    JOIN items ON orderitems.item_id = items.id
    WHERE customer_id = #{arg};
    SQL
    database_connection.sql(var).map do |hash|
      hash["name"]
    end
  end

  # returns the correct customer names and ids for customers that bought 'bike01'
  def customers_that_bought_item(arg)
    var = <<-SQL
    SELECT customers.name as customer_name, customers.id
    FROM customers
    JOIN orders ON orders.customer_id = customers.id
    JOIN orderitems ON orderitems.order_id = orders.id
    JOIN items ON items.id = orderitems.item_id
    WHERE items.name = '#{arg}'
    GROUP BY customers.name, customers.id
    SQL
    database_connection.sql(var)
  end

  def customers_that_bought_item_in_state(item, state)
    var = <<-SQL
    SELECT customers.id, customers.name, customers.email, customers.address, customers.city, customers.state, customers.zipcode
    FROM customers
    JOIN orders ON orders.customer_id = customers.id
    JOIN orderitems ON orderitems.order_id = orders.id
    JOIN items ON items.id = orderitems.item_id
    WHERE customers.state = '#{state}' AND items.name = '#{item}';
    SQL
    database_connection.sql(var).first
  end
end
