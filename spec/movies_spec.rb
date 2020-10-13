require 'movies'

RSpec.describe 'RegularMovies' do
  it "remembers it's name" do
    expect(RegularMovie.new('Top Gun').name).to eq('Top Gun')
  end

  context 'calculate costs' do
    it 'calculates costs rentals of different lengths' do
      expectations = [
        { rental_length: 1, cost: 2 },
        { rental_length: 2, cost: 2 },
        { rental_length: 3, cost: 3.5 },
        { rental_length: 4, cost: 5 },
        { rental_length: 5, cost: 6.5 }
      ]
      movie = RegularMovie.new('Top Gun')
      expectations.each do |test_case|
        expect(movie.calculate_cost(test_case[:rental_length])).to eq(test_case[:cost])
      end
    end
  end

  context 'calculate points' do
    it 'calculates points for a one-day rental' do
      expectations = [
        { input: 1, expected_output: 1 },
        { input: 2, expected_output: 1 },
        { input: 996, expected_output: 1 }
      ]
      movie = RegularMovie.new('Top Gun')
      expectations.each do |test_case|
        expect(movie.calculate_points(test_case[:input])).to eq(test_case[:expected_output])
      end
    end
  end
end

RSpec.describe 'NewReleaseMovie' do
  context 'When created' do
    it 'remembers its name' do
      expect(NewReleaseMovie.new('Top Gun 2').name).to eq('Top Gun 2')
    end
  end

  context 'calculate costs' do
    it 'calculates costs rentals of different lengths' do
      expectations = [
        { rental_length: 1, cost: 3 },
        { rental_length: 2, cost: 6 },
        { rental_length: 3, cost: 9 }
      ]
      movie = NewReleaseMovie.new('Top Gun 2')
      expectations.each do |test_case|
        expect(movie.calculate_cost(test_case[:rental_length])).to eq(test_case[:cost])
      end
    end
  end

  context 'calculate points' do
    it 'calculates points for a one-day rental' do
      expectations = [
        { rental_length: 1, points: 1 },
        { rental_length: 2, points: 2 },
        { rental_length: 996, points: 2 }
      ]
      movie = NewReleaseMovie.new('Top Gun')
      expectations.each do |test_case|
        expect(movie.calculate_points(test_case[:rental_length])).to eq(test_case[:points])
      end
    end
  end
end

RSpec.describe 'ChildrenMovie' do
  context 'When created' do
    it 'remembers its name' do
      expect(ChildrenMovie.new('Frozen').name).to eq('Frozen')
    end
  end

  context 'calculate costs' do
    it 'calculates costs rentals of different lengths' do
      expectations = [
        { rental_length: 1, cost: 1.5 },
        { rental_length: 3, cost: 1.5 },
        { rental_length: 4, cost: 3 },
        { rental_length: 5, cost: 4.5 },
        { rental_length: 13, cost: 16.5 }
      ]
      movie = ChildrenMovie.new('Frozen')
      expectations.each do |test_case|
        expect(movie.calculate_cost(test_case[:rental_length])).to eq(test_case[:cost])
      end
    end
  end

  context 'calculate points' do
    it 'calculates points for a one-day rental' do
      expectations = [
        { rental_length: 1, points: 1 },
        { rental_length: 2, points: 1 },
        { rental_length: 996, points: 1 }
      ]
      movie = ChildrenMovie.new('Frozen')
      expectations.each do |test_case|
        expect(movie.calculate_points(test_case[:rental_length])).to eq(test_case[:points])
      end
    end
  end
end
