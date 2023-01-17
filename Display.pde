class Display implements Base{
  //h はスクロールの制限値
  int h;
  
  PVector origin;//全てのアイテムの基準になる変数
  
  Display(PVector origin,int h){//初期化
    this.origin=origin;
    this.h=-abs(h);//h()
  }
  Display(){}
  void setY(float y){
    this.origin.y+=y;//基準点を縦方向に移動
    if(this.origin.y<=h)this.origin.y-=y;//基準点が制限値を超えていたら無かった事にする
  }
  float getY(){
    return this.origin.y;
  }
  int getH(){
    return this.h;
  }
  void setH(int h){
    this.h=-abs(h);
  }
  PVector getP(){
    return this.origin;
  }
  @Override
  void show(){//drawの変わり
    this.body();
    this.title();
    this.scroll();
  }
  void title(){//Launcher題名(一番上のやつ)
    noStroke();
    fill(150,255,150);
    rect(0,origin.y-50,width,100);
    fill(0);
    textFont(createFont("Cooper Black",75));
    text("GameLauncher",100,origin.y+25);
  }
  void body(){//背景と左右の枠
    background(150,150,255);//枠線の色
    fill(255);
    noStroke();
    rect(25,0,width-50,height);//背景
  }
  void scroll(){//スクロールバー
    fill(250,250,250,150);
    rect(width-17,map(origin.y,this.h+20,40,height,30),10,50,90);
  }
  
}
