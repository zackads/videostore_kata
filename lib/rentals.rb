class Rentals
  attr_reader :customer_name

  def initialize(customer_name: '', movies: [])
    @customer_name = customer_name
    @rentals = movies
  end

  def movies
    @rentals
  end
end
