class Triangle
  # write code here
  attr_accessor :l1, :l2, :l3
  def initialize(l1,l2,l3)
    @l1 = l1
    @l2 = l2
    @l3 = l3
  end

  def illegal_triangles
    return true if (l1+l2<=l3) || (l1+l3<=l2) || (l2+l3<=l1) || (l1<=0) || (l2<=0) || (l3<=0)
    return false
  end

  def kind
    if illegal_triangles
      raise TriangleError
    elsif l1==l2 && l2==l3
      return :equilateral
    elsif (l1==l2) || (l2==l3) || (l1==l3)
      return :isosceles
    else
      return :scalene
    end
  end

  class TriangleError < StandardError
  end



end
