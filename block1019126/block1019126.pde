PImage Background;
PImage character;
int score;
int chargeTime=0;

void setup(){
  size(1200, 600);
  frameRate(70);
  score =  0;
  //背景
  Background = loadImage("megeman-back.jpg");
  Background.resize(width, height);
   //キャラクター表示
   character = loadImage("nc8156.png");
  //ブロック初期化
  for (int y = 0; y < blocks_row; y++) {
    for (int x = 0; x < blocks_col; x++) {
      int i = x + (y * blocks_col);
     // blockColor[i] = block_color1;
      blockColor[i] = lerpColor(block_color1, block_color2, x / width);
      blockX[i] = first_block_x; 
      blockY[i] = first_block_y;
      block[i] = new DrawBlock(blockX[i], blockY[i], block_width, block_height, blockColor[i]);
    }
  }
}

void draw(){
  background(Background);
  score();
  //ブロック生成
  if (frameCount % 60 == 0) {
    for (int i=0; i<BLOCK.size(); i++) {
      BLOCK.get(i).proceed();//ブロックを押し出す
    }
    for (int i= 0; i<5; i++) {
      BLOCK.add(new DrawBlock(width-50, i*height/5, 50, height/5, 150)); //ブロックの大きさ
    }
  }
  for (int i=0; i<BLOCK.size(); i++) {
  BLOCK.get(i).display();
  }
   //弾幕実装
  for (int i=tamaList.size ()-1; i >= 0; i--) {//弾表示とremove
    fill(215, 150, 0);
    TAMA t = tamaList.get(i);
    if (t.isAlive()) {
      t.move();
      t.display();
    } else {
      tamaList.remove(i);
    }
  }
   if(shift == true){
     fill(215, 150, 0); 
     chargeTime++;
      if(chargeTime == 120){
        largeTama.add(new ChargeShot(chara_x,chara_y));
        //largeTama.get(tamaList.size()-1).largeTama();
        chargeTime=0;
      }
    }
  for (int i=largeTama.size ()-1; i >= 0; i--) {//弾表示とremove
    fill(215, 150, 0);
    ChargeShot t = largeTama.get(i);
    if (t.isAlive()) {
      t.move();
      t.display();
    } else {
      largeTama.remove(i);
    }
  }
  //当たり判定
  for(int i = 0;i < tamaList.size();i++){
    for(int j = 0;j < BLOCK.size();j++){
      if(tamaList.get(i).by > BLOCK.get(j).y && tamaList.get(i).by < BLOCK.get(j).y + BLOCK.get(j).h && tamaList.get(i).bx > BLOCK.get(j).x){
        score += 50;
        BLOCK.remove(j);
        tamaList.remove(i);
        break;
      }
    }
  }
  for(int i = 0;i < largeTama.size();i++){
    for(int j = 0;j < BLOCK.size();j++){
      if(largeTama.get(i).by*1.25 >= BLOCK.get(j).y && largeTama.get(i).by*1.25 <= BLOCK.get(j).y + BLOCK.get(j).h && largeTama.get(i).bx > BLOCK.get(j).x){
        score += 100;
        BLOCK.remove(j);
        break;
      }
    }
  }
  
  //プレイヤー表示
 // fill(255);
  player(chara_x, chara_y);
//if(chara_y > 300) chara_y = 300;
      //image(character, chara_x, chara_y, character.width/64, character.height/64);
}

void score(){
  textSize(24);
  fill(255);
  text("score:" + score, 550, 50);
}
