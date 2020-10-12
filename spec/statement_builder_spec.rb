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
  end
end
