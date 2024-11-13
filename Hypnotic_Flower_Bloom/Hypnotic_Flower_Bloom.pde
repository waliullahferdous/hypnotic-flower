int numPetals = 400;      // Number of petals
float bloomSpeed = 0.015;  // Speed of bloom animation
float rotationSpeed = 0.0075; // Speed of rotation
float petalLength = 400;  // Length of each petal

void setup() {
  size(1700, 1000);
  noFill();
}

void draw() {
  background(10, 10, 30);  // Dark background for contrast

  translate(width / 2, height / 2); // Move origin to center for rotation

  float time = frameCount * bloomSpeed; // Time variable for animation

  // Draw each petal with a dynamic color and rotation
  for (int i = 0; i < numPetals; i++) {
    float angle = TWO_PI / numPetals * i + time * rotationSpeed; // Calculate angle with rotation
    float distance = sin(time + i * 0.1) * petalLength; // Growing effect with sinusoidal wave

    // Calculate x and y positions using polar coordinates
    float x = cos(angle) * distance;
    float y = sin(angle) * distance;

    // Set dynamic color gradient for petals
    stroke(200 + sin(i * 0.3 + time) * 55, 100 + cos(i * 0.2 + time) * 100, 255, 150);

    // Draw a petal as a curving line
    beginShape();
    for (float t = 0; t < 1; t += 0.05) {
      float petalX = lerp(0, x, t);
      float petalY = lerp(0, y, t) + sin(t * PI * 5 + time) * 20; // Curving effect
      vertex(petalX, petalY);
    }
    endShape();
  }
}
