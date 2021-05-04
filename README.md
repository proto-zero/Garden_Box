# Garden Box

## How To Run The Program

Run the program through gardenbox.rb, which will utilize the datebase contained in gbdb.sqlite.

## Files

gardenbox.rb      - A Garden Box with a stylish visual UI

gbdb.sqlite       - A Database containing Crops and Yield/sq.ft.

## Instructions
## Screen One

The first screen asks for the specifications of the Garden Box, prompting the User first for the Width, then the Length.

The X-Axis and Y-Axis will update as the User enters the size of the Garden Box. Only whole number integers are accepted.

## Screen Two

The Perimeter and Area of the Garden Box are automatically calculated and displayed.

The Garden Box is created as a grid, filled with *'s. Each * represents an empty 1 square foot space.

A prompt asks the User to choose a Vegetable: Carrots, Corn, or Beets. Any other choices will result in an INVALID Display.

## Screen Three

The Garden Box is updated with X's to indicate spaces that are planted with the chosen Vegetable. Each Vegetable is contained in the Database, along with total required square footage for each plant. Carrots take up less space than beets, and even less space than corn. Each Vegetable will fill the Garden Box differently depending on the total Area of the Box.
