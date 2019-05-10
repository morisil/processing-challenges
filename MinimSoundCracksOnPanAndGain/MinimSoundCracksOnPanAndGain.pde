/*
 * Single file is played in the loop, when mouse pressed:
 *  - pan control: horizontally mouse movement
 *  - gain control: vertical mouse movement
 *
 * On Ubuntu Linux I can hear cracking sound when these values are changed rapidly.
 */

import ddf.minim.*;
import ddf.minim.ugens.*;

static final String SOUND_LOOP = "https://sampleswap.org/samples-ghost/LOOPING%20AMBIENCE/1648[kb]etheral-chord.wav.mp3";
static final float NON_AUDIBLE_GAIN = -100;

Minim minim;
AudioOutput out;
FilePlayer loopSound;
Pan pan;
Gain gain;

float panValue;
float gainValue;

void setup() {
  size(800, 600);
  minim = new Minim(this);
  pan = new Pan(0);
  gain = new Gain(0);
  out = minim.getLineOut(Minim.STEREO);
  loopSound = new FilePlayer(minim.loadFileStream(SOUND_LOOP));  
  loopSound.patch(gain).patch(pan).patch(out);
  loopSound.loop();
}

void draw() {}

void mouseDragged() {
  panValue = map(mouseX, 0, width, -1, 1);
  gainValue = map(mouseY, 0, height, 0, NON_AUDIBLE_GAIN);
  pan.setPan(panValue);
  gain.setValue(gainValue);
}
