class Triangle
  def initialize(a, b, c)
    @sides = [a, b, c]
  end

  def has_too_short_side?
    @sides.any? { |side| side <= 0 }
  end

  def violates_triangle_inequality?
    @sides.permutation.any? { |perm| perm[0] >= perm[1] + perm[2] }
  end

  def kind
    raise TriangleError if has_too_short_side? || violates_triangle_inequality?

    return :equilateral if @sides.uniq.length == 1
    return :isosceles if @sides.combination(2).any? { |two_sides| two_sides[0] == two_sides[1] }
    return :scalene if @sides.length == @sides.uniq.length
  end

  class TriangleError < StandardError
  end
end
