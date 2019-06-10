class Image
	def initialize(image)
#the method initialize is a special method with a special meaning in Ruby: 
#Whenever you call the method new on a class, as in Person.new , 
#the class will create a new instance of itself.
		@image = image
	end

  def output_image
    @image.each do |row|
      puts row.join 
#Returns a string created by converting each element of the array to a string, 
#separated by the given separator.
    end
  end

end

#keep the definition and the instances separate.

row1 = [0, 0, 0, 0]
row2 = [0, 1, 0, 0]
row3 = [0, 0, 0, 1]
row4 = [0, 0, 0, 0]

image = Image.new(
	[row1, row2, row3, row4]
)

image.output_image

#image = Image.new([
#  [0, 0, 0, 0],
#  [0, 1, 0, 0],
#  [0, 0, 0, 1],
#  [0, 0, 0, 0]
# ])
#image.output_image