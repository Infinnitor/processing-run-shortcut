int c = 50;
int v = 3;
int b = v;

void setup() {
	size(800, 600);
}

void draw() {
	c += b;
	b = (c > 255) ? -v : b;
	b = (c < 50) ? v : b;

	background(c, 35, c);
}
