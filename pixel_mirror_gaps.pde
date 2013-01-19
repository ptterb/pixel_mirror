import processing.video.*;

Capture cam;
PImage displayImg;


void setup(){
	background(0);
	size(640, 480);

        // Start new camera
	cam = new Capture(this, 640, 480);
	cam.start();
	displayImg = new PImage(640, 480);
}

void draw(){
        // Grab camera feed
	if (cam.available()) {
		cam.read();

                // The gaps are caused by the incrementation here. We're only checking every 10th pixel and drawing a 5 pixel square
		for (int x = 0; x < cam.width; x+=10) {
			for (int y = 0; y < cam.height; y+=10) { 
				int camIndex = x + y * cam.width;
				int disIndex = (width -x - 1) + y * cam.width;

				displayImg.pixels[disIndex] = cam.pixels[camIndex];
				fill(cam.pixels[disIndex]);
				noStroke();
				rect(x, y, 5, 5);	
			}
		}
	}
}
