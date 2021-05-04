require 'sqlite3'

# Connection to Database
db = SQLite3::Database.open "gbdb.sqlite"
db.results_as_hash = true

# Variables
lw = 50
width = 0
length = "-"
choice = "[---]"
crop_name = []
crop_id = []

# Grab Crop Names and Crop ID from Database
rs = db.execute("SELECT * FROM Crops")
rs.each do |row|
  crop_name.push row['Name']
  crop_id.push row['CropID']
end

# FIRST SCREEN
looping = true
while looping
  system("clear")
  puts "Enter your GR-DN_BO.xx specifications:".center (lw)
  puts
  puts "X-Axis:#{width}                Y-Axis:#{length}  ".center (lw)
  puts
  puts "Perimeter:                Area: ".center (lw)
  puts
  puts
  puts

# Ask for length and width
  if length == 0
    print "   length: "
    length = gets.chomp.to_i
    looping = false
  end
  if width == 0
    print "   width: "
    width = gets.chomp.to_i
    length = 0
  end
end

# Variables
area = length * width
perimeter = (length * 2) + (width * 2)

# Visual Garden Box Dimensions
## Game Of Life map
grid = [];
(0...length).each do |row|
    grid[row] = []
    (0...width).each do |column|
        grid[row][column] = "* "
    end
end

# SECOND SCREEN
looping = true
while looping
  system("clear")
  puts "GR-DN_BO.xx Activated".center (lw)
  puts
  puts "X-Axis:#{width}                      Y-Axis:#{length}  ".center (lw)
  puts
  puts "Perimeter: #{perimeter} ft.         Area: #{area} sq.ft.".center (lw)
  puts
  ## Prints map
  (0...length).each do |row|
      print " " * (lw / 3)
      (0...width).each do |column|
          print grid[row][column]
      end
      puts
  end
  puts
  puts
  puts "             VGT.ble: #{choice}"
  sleep(0.5)
  puts "-#{crop_name.join("- -")}-".center (lw)
  sleep(0.5)
  print "   Specify VGT.ble: "

  # Ask for crop to be planted
  choice = gets.chomp.downcase
  if crop_name.include?(choice)
    looping = false
  else
    choice = "--INVALID--"
  end
end

# Crop Math
crop_amount = 0
rs = db.execute("SELECT Value FROM Crops WHERE Name=?", [choice])
rs.each do |x|
  crop_amount = x['Value']
end
total = (crop_amount * area).floor

# Fill out garden box with number of plantable crops
row = 0
col = 0
p = 0

while p < total
  if row < length
    grid[row][col] = "X "
    row += 1
    p += 1
  elsif row == length
    row = 0
    col += 1
  end
end

# THIRD SCREEN
system("clear")
puts "GR-DN_BO.xx Activated".center (lw)
puts
puts "X-Axis:#{width}                      Y-Axis:#{length}  ".center (lw)
puts

puts "Perimeter: #{perimeter} ft.         Area: #{area} sq.ft.".center (lw)
puts
## Prints map
(0...length).each do |row|
    print " " * (lw / 3)
    (0...width).each do |column|
        print grid[row][column]
    end
    puts
end
puts
puts
puts "             VGT.ble: -#{choice}-"
sleep(0.5)
puts "    Alottment/sq.ft.: #{total}"
puts
puts

# End Of Line
