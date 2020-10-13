require 'rentals'
require 'movies'

# Write a system that can build a statement, when given rentals.
require_relative '../../lib/statement_builder.rb'

RSpec.describe 'given a statement is requested for customer Joe Bloggs' do
  context 'when there are no rentals' do
    it 'gives a statement of no rentals, no fees and no loyalty points' do
      # Arrange
      rentals = Rentals.new(customer_name: 'Steve Stevington', movies: [])
      expected_output = <<~STATEMENT
        Rental Record for Steve Stevington
          You have no rentals
        You owe 0.0
        You earned 0 frequent renter points
      STATEMENT

      # Act
      statement = StatementBuilder.new(rentals).statement

      # Assert
      expect(statement).to eq(expected_output)
    end
  end

  context 'when there is one regular move rental rental lasting 1 day' do
    it 'gives a statement containing 1 x rental, owing 2.0, earning 1 loyalty point' do
      # Arrange
      movie = RegularMovie.new('Crazynotes')
      rentals = Rentals.new(customer_name: 'Laura Lawley', movies: [movie])

      expected_output = <<~STATEMENT
        Rental Record for Laura Lawley
          Crazynotes  2.0
        You owe 2.0
        You earned 1 frequent renter point
      STATEMENT

      # Act
      statement = StatementBuilder.new(rentals).statement

      # Assert
      expect(statement).to eq(expected_output)
    end
  end
end
