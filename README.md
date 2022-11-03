# MonteCarloPI
Monte Carlo PI estimation by the well known method of the "darts". The method is very simple indeed.
First we draw a unit circle with it's center at the coordinate system center (0, 0). The face of this circle is S_circ = PI * r ^ 2. r is 1 so the face of the unit circle is exactly PI. Then we consider the circumscribed rectangle of the circle (it's bounding box), which is a quadrate with side equal to 2 * r or 2. It's face is as follows: S_quadr = 2 * 2 = 4.
Ok now we imagine we throw a dart and our target is the circle but the dart is hitting every time a random point inside the qudrate. It is 
easy to conclude that the area of the circle divided by the area of the rectangle is equal to the number of hits inside the circle divided by the total number of hits:
  PI / 4 = #hits / #shots <=> PI = 4 * (#hits / # shots). That's everything this is enough and we can estimate PI this way if we make enough tries (iterations).
