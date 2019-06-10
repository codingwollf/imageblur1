class Image
#the method initialize is a special method with a special meaning in Ruby: 
#Whenever you call the method new on a class, as in Person.new , 
#the class will create a new instance of itself.
  def initialize (array)
    @array = array
    @row_length = array.length
    @col_length = array[0].length
  end

  def output_image
    @array.each do |blurred|
      puts blurred.join
      #Returns a string created by converting each element of the array to a string, 
      #separated by the given separator.
    end
  end

  # building method to locate all of the 1s in the 2D array
  def coords
    blur_pixels = []
    # nested loops for rows and columns
    @array.each_with_index do |row, row_int| # iterating over integers in arrays 
      row.each_with_index do |int, col_index| 
        if int == 1
          blur_pixels << [row_int, col_index] # << is pushing into the array from blur_pixels.each do
        end
      end
    end
    blur_pixels
  end


  # building method to adulterate integers around 1s
  def blur! #needs the !, is a bang, syntax is telling that is going to change the state of what we are operating on.
    blur_pixels = coords # accessing array from previous method
      @array.each_with_index do |row, row_int|
        row.each_with_index do |int, col_index|
          blur_pixels.each do |row_int_coord, col_index_coord|

            if row_int == row_int_coord && col_index == col_index_coord
              # left of 1
              @array[row_int][col_index -1] = 1 unless col_index == 0
              # right of 1
              @array[row_int][col_index +1] = 1 unless col_index >= @col_length-1
              # aboe 1
              @array[row_int -1][col_index] = 1 unless row_int == 0
              # below 1
              @array[row_int +1][col_index] = 1 unless row_int >= @row_length-1
            end
          end
        end
      end
  end

end

#this is the original image
image = Image.new([
  [0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0],
  [0, 0, 0, 0, 1],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
])

puts "Original image: "
image.output_image

puts "Adulterated image: "
image.blur!
image.output_image
#now the blurred image is showing below the original image