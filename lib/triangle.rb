class Triangle
  attr_reader :a, :b, :c
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  # All sides the same = equilateral
  # Two sides the same = isosceles
  # Neither of above = scalene (for this exercise)
  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    #Defines what makes a real trinagle. No side longer than the other two combined
    real_triangle = [(a + b > c), (a + c > b), (b + c > a)]
    #Puts the current triangle through the above test. If any dont pass i.e. equal 0
    #Or less pushes false into the array. If any are false it called the below error
    [a, b, c].each { |s| real_triangle << false if s <= 0 }
    raise TriangleError if real_triangle.include?(false)
  end

  class TriangleError < StandardError
  end

end
