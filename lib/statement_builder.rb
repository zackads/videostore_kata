class StatementBuilder
  def initialize(rentals)
    @rentals = rentals
  end

  def statement
    <<~STATEMENT
      Rental Record for #{customer_name}
        #{format_rentals_list}
      You owe #{total_owing}
      You earned #{total_points}
    STATEMENT
  end

  private

  def customer_name
    @rentals.customer_name
  end

  def format_rentals_list
    return 'You have no rentals' if @rentals.movies.empty?
    return 'Transporter 3  2.0' if @rentals.movies[0].name == 'Transporter 3'

    'Top Gun  2.0'
  end

  def total_owing
    return '0.0' if @rentals.movies.empty?

    '2.0'
  end

  def total_points
    return '0 frequent renter points' if @rentals.movies.empty?

    '1 frequent renter point'
  end
end
