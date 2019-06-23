int chara_x = 20;
int chara_y = 300;
class player{
  //自機のサイズ
  int sizeP;
  player(){
    sizeP = 100;
  }
  void move(int _x, int _y){
    chara_x = _x;
    chara_y = _y;
  }
  void display(){
    stroke(0);
    ellipse(chara_x, chara_y, sizeP, sizeP);
  }
}

void player(int a, int b){
  rect(chara_x, chara_y, 100, 100);
  if(right) chara_x += 4;
  if(left) chara_x -= 4;
  if(up)  chara_y -= 4;
  if(down) chara_y += 4;
}
