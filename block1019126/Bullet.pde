//弾関係
ArrayList<TAMA> tamaList = new ArrayList<TAMA>();
ArrayList<ChargeShot> largeTama = new ArrayList<ChargeShot>();
//弾クラス
class TAMA{
  float bx, by;//弾のx, y
  float size;//弾のサイズ
  float speed;//弾のスピード
  
  TAMA(float _x, float _y){
    bx = _x;//弾の初期位置
    by = _y;//弾の初期位置
    size = 20;//弾のサイズ
    speed = 8;
  }
  void move(){
    bx += speed;
  }
  
  /*void largeTama(){
  size+=30;
  }*/
  
  //弾の表示
  void display(){
    noStroke();
    ellipse(bx, by + 50, size, size);
  }
 //画面内かどうか
  boolean isAlive(){
   if(bx + size/2 < 0 || width < bx - size/2 || by + size < 0 || height < by - size/2){
      return false;
    }
     return true;
  }
}

class ChargeShot extends TAMA{
  ChargeShot(float x, float y){
    super(x, y);
    size = 60;
  }
}
