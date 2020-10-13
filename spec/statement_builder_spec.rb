require_relative '../lib/statement_builder'

RSpec.describe StatementBuilder do
  context 'given a customer has rented no movies' do
    it "includes the customer's name in the statement" do
      # Arrange
      customer_names = ['Becky Beckington', 'Steve Stevingont', 'Rufus Ruffley']
      rentals = customer_names.map { |name| double('Rentals', customer_name: name, movies: []) }

      # Act
      statements = rentals.map { |rentals_obj| StatementBuilder.new(rentals_obj).statement }

      # Assert
      expect(statements[0]).to include(customer_names[0])
      expect(statements[1]).to include(customer_names[1])
      expect(statements[2]).to include(customer_names[2])
    end

    it 'includes no movies in the statement' do
      # Arrange
      rentals = double('Rentals', customer_name: 'Steve Stevington', movies: [])
      expected_output = <<~STATEMENT
        Rental Record for Steve Stevington
          You have no rentals
        You owe 0.0
        You earned 0 frequent renter points
      STATEMENT
      statement_builder = StatementBuilder.new(rentals)

      # Act
      statement = statement_builder.statement

      # Assert
      expect(statement).to eq(expected_output)
    end
  end

  context 'given a customer has rented 1 regular movie for 1 day' do
    it 'includes that movie in the statement' do
      # Arrange
      movie = double('RegularMovie', name: 'Top Gun', calculate_cost: 2, calculate_points: 1)
      rentals = double('Rentals', customer_name: 'Maverick', movies: [movie])
      expected_output = <<~STATEMENT
        Rental Record for Maverick
          Top Gun  2.0
        You owe 2.0
        You earned 1 frequent renter point
      STATEMENT
      statement_builder = StatementBuilder.new(rentals)

      # Act
      statement = statement_builder.statement

      # Assert
      expect(statement).to eq(expected_output)
    end

    it 'includes that movie in the statement' do
      # Arrange
      movie = double('RegularMovie', name: 'Transporter 3', calculate_cost: 2, calculate_points: 1)
      rentals = double('Rentals', customer_name: 'Maverick', movies: [movie])
      expected_output = <<~STATEMENT
        Rental Record for Maverick
          Transporter 3  2.0
        You owe 2.0
        You earned 1 frequent renter point
      STATEMENT
      statement_builder = StatementBuilder.new(rentals)

      # Act
      statement = statement_builder.statement

      # Assert
      expect(statement).to eq(expected_output)
    end
  end

  context 'given a customer has rented 2 regular movie for 1 day' do
    xit 'includes that movie in the statement' do
      # Arrange
      movie_1 = double('RegularMovie', name: 'Top Gun', calculate_cost: 2, calculate_points: 1)
      movie_2 = double('RegularMovie', name: 'Transporter 3', calculate_cost: 2, calculate_points: 1)
      rentals = double('Rentals', customer_name: 'Maverick', movies: [movie_1, movie_2])
      expected_output = <<~STATEMENT
        Rental Record for Maverick
          Top Gun  2.0
        You owe 2.0
        You earned 1 frequent renter point
      STATEMENT
      statement_builder = StatementBuilder.new(rentals)

      # Act
      statement = statement_builder.statement

      # Assert
      expect(statement).to eq(expected_output)
    end
  end
end
