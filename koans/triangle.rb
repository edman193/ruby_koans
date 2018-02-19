# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(*args)
   args.sort!
   raise TriangleError, "No side of a triangle can be equal to zero"  if args.any? { |side| side == 0 }
   raise TriangleError, "No side of a triangle can be negative"  if args.any? { |side| side < 0 }
   raise TriangleError, "The highest side must be less than the sum of other two sides"  if args[2] >= args[0, 2].inject(0, :+)

   return :equilateral if args.uniq.length == 1
   return :isosceles if args.uniq.length == 2
   :scalene
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
