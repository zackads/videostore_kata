class StatementBuilder
  def initialize(rentals)
    @rentals = rentals
  end

  def statement
    <<~STATEMENT
      Rental Record for #{customer_name}
        #{format_rentals_list}
      You owe 0.0
      You earned 0 frequent renter points
    STATEMENT
  end

  private

  def customer_name
    @rentals.customer_name
  end

  def format_rentals_list
    if @rentals.movies.empty?
      'You have no rentals'
    else
      formatted_rentals_list = ''
      @rentals.movies.each do |movie|
        formatted_rentals_list += "#{movie.name}   #{movie.calculate_cost}"
      end
    end
  end
end
