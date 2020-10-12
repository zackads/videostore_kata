require_relative '../lib/rentals.rb'

RSpec.describe Rentals do
  context 'when there are no movies rented' do
    it 'is empty' do
      # Arrange
      rentals = Rentals.new(customer_name: 'Joe Bloggs', movies: [])
      expected_output = []

      # Act
      movies = rentals.movies

      # Assert
      expect(movies).to eq(expected_output)
    end
  end

  context 'when there are is 1 regular movie rented for 1 day' do
    it '' do
      # Arrange
      movie = RegularMovie.new(title: 'Crazynotes', days_rented: 1)
      rentals = Rentals.new(customer_name: 'Joe Bloggs', movies: [movie])
      expected_output = []

      # Act
      movies = rentals.movies

      # Assert
      expect(movies).to eq(expected_output)
    end
  end
end
