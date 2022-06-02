# `line_intersection` [![View Intersection of Two Lines (line_intersection) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/85428-intersection-of-two-lines-line_intersection)

Finds the intersection of two lines.


## Syntax

`[x_int,y_int] = line_intersection(line1,line2)`


## Description

`[x_int,y_int] = line_intersection(line1,line2)` returns the intersection `[x_int,y_int]` of two lines. Each line can be defined in four different ways:

   1. `line = x0`: vertical line form (vertical line defined as <img src="https://latex.codecogs.com/svg.latex?\inline&space;x=x_0" title="x=x_0" />)
   2. `line = [m,b]`: slope-intercept form (<img src="https://latex.codecogs.com/svg.latex?\inline&space;y=m&space;x+b"/>) 
   3. `line = [x0,y0,m]`: point-slope form (<img src="https://latex.codecogs.com/svg.latex?\inline&space;y-y_0&space;=m&space;(x-x_0&space;)"/>)
   4. `line = [x1,y1,x2,y2]`: two point form (line that contains the points <img src="https://latex.codecogs.com/svg.latex?\inline&space;(x_1,y_1)" title="(x_1,y_1)" /> and <img src="https://latex.codecogs.com/svg.latex?\inline&space;(x_2,y_2)" title="(x_2,y_2)" />)

## Edge Cases:

   - Vertical lines can be defined using the vertical line form or the two point form.
   - If the two lines are parallel (but not collinear), the function returns positive or negative infinity for the coordinates of the intersection, and a warning is displayed.
   - If the two lines are collinear (but not vertical), the function returns `[NaN,NaN]` and displays a warning.
   - If the two lines are vertical _and_ collinear, the function returns the x-coordinate of the line for the x-coordinate of the intersection, and `NaN` for the y-coordinate of the intersection.
 
## Examples and Additional Documentation

   - See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   - See ["Intersection_of_Two_Lines.pdf"](https://tamaskis.github.io/documentation/Intersection_of_Two_Lines.pdf) (also included with download) for the technical documentation.
