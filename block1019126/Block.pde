int blocks_row;//ブロックの行数
int blocks_col; //ブロックの列数
int [] blockX = new int[blocks_row * blocks_col]; //ブロックのx座標格納用の配列
int [] blockY = new int[blocks_row * blocks_col];  // ブロックのy座標格納用の配列
color[] blockColor = new int[blocks_row * blocks_col];
int first_block_x; // 最初のブロックのx座標
int first_block_y; // 最初のブロックのy座標
int block_width; // ブロックの幅
int block_height; // ブロックの高さ

color block_color1 = color(255, 140, 0); // ブロックのグラデーション色
color block_color2 = color(0, 255, 255); // ブロックのグラデーション色
ArrayList<DrawBlock> BLOCK = new ArrayList<DrawBlock>();
DrawBlock[] block  = new DrawBlock[blocks_row * blocks_col]; // ブロック描画用オブジェクトの宣言

// ブロック描画用クラス
class DrawBlock{
  float _bx,_by;
  int x, y, w, h;
  color rgb;
  boolean removeJudge;
  DrawBlock(int block_x, int block_y, int block_width, int block_height, color rgb_color){
    x = block_x;
    y = block_y;
    w = block_width;
    h = block_height;
    rgb = rgb_color;
  }
  //ブロック表示
  void display(){
    stroke(200, 200, 200);
    fill(rgb, 200);
    rect(x, y, w, h);
  }
  
  //ブロックスクロール
  void proceed(){
  x -= 50;  
  }

}
