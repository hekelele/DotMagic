PGraphics pg;
PGraphics pg2;

int g_size = 400;


void setup(){
  size(1100,600,P2D);
  pg = createGraphics(g_size, g_size);
  pg.beginDraw();
  pg.background(255);
  pg.stroke(0);
  float sz = g_size*1f/20;
  for(int i=0; i<20; i++){
    pg.line(0,i*sz+sz*0.5f,g_size,i*sz+sz*0.5f);
    pg.line(i*sz+sz*0.5f,0,i*sz+sz*0.5f,g_size);
  }
  pg.endDraw();
  pg2 = createGraphics(g_size, g_size,P2D);

  reflect(pg,pg2);
}


void draw(){
  background(200);
  image(pg,100,100);
  image(pg2,600,100);
}

void reflect(PGraphics s,PGraphics f){
	s.loadPixels();

	f.beginDraw();
	f.background(255);
	float sz = 4;
	for (int i = 0; i < s.pixels.length; i++) {
		int xx,yy;
		xx = i%g_size;
		yy = i/g_size;
		float xx2,yy2;
		xx2 = xx+sz*cos(yy*0.3f);
		yy2 = yy;
		f.fill(s.pixels[i]);
		f.noStroke();
		f.rect(xx2,yy2,1,1);
	}
	f.endDraw();
}
