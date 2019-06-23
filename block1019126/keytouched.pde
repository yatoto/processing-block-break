//キーボード設定
boolean right, left, up, space, shift, down;

void keyPressed(){
  if(key ==' '){
    space = tamaList.add(new TAMA(chara_x, chara_y));
  }
  if(keyCode == RIGHT) right = true;
  if(keyCode == LEFT) left = true;
  if(keyCode == UP) up = true;
  if(keyCode == DOWN) down = true;
  if(keyCode == SHIFT) shift = true;
}
void keyReleased(){
  if(keyCode == RIGHT) right = false;
  if(keyCode == LEFT)  left  = false;
  if(keyCode == UP)    up    = false;
  if(keyCode == DOWN) down = false;
  if(keyCode == SHIFT) shift = false;
  if(key == ' ') space = false;
}
