size(100,100,P2D);


PGraphics pg;
PImage pm = loadImage("sample.png");

int im_x = pm.width;
int im_y = pm.height;

float center_xx = im_x/2;
float center_yy = im_y/2;

int radius = int(min(center_xx,center_yy));

pg = createGraphics(im_x,im_y);


pm.loadPixels();

pg.beginDraw();
pg.background(255);

for (int i = 0; i < pm.pixels.length; i++) {
	int xx,yy;
	xx = i%im_x;
	yy = i/im_x;
	float xx2,yy2;

	float dx = (xx - center_xx)/radius;
	float dy = (yy - center_yy)/radius;

	float u = dx*sqrt(1-dy*dy/2);
	float v = dy*sqrt(1-dx*dx/2);

	xx2 = u*radius+center_xx;
	yy2 = v*radius+center_yy;
		
	pg.fill(pm.pixels[i]);
	pg.noStroke();
	pg.rect(xx2,yy2,1,1);
}
pg.endDraw();


pg.save("output.png");