class Movie
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def calculate_cost(days); end

  def calculate_points(days); end
end

class RegularMovie < Movie
  def calculate_cost(days)
    cost = 2
    return cost if days <= 2

    cost + (days - 2) * 1.5
  end

  def calculate_points(_days)
    1
  end
end

class NewReleaseMovie < Movie
  def calculate_cost(days)
    days * 3
  end

  def calculate_points(days)
    return 1 if days == 1

    2
  end
end

class ChildrenMovie < Movie
  def calculate_cost(days)
    cost = 1.5
    return cost if days <= 3

    cost + (days - 3) * 1.5
  end

  def calculate_points(_days)
    1
  end
end

# class RegularMovies < Movies
#     # ...
# end

# -------

# class RegularMovies
#     def calculate_cost(days_rental)
#         # ...

#     def calculate_points(days_rental)
#         return 1
# end

# class ChildrensMovies
#     def calculate_cost(days_rental)
#         # ...

#     def calculate_points(days_rental)
#         return 1
# end

# class NewReleasesMovies
#     def calculate_cost(days_rental)
#         # ...

#     def calculate_points(days_rental)
#         return 1
# end

# ---

# movies = [RegularMovies.new, ChildrensMovies.new, NewReleasesMovies.new]
# movies.each { |movie| movie.calculate_cost }

# statement_builder = StatementBuilder

# statement_builder.build(movies)
