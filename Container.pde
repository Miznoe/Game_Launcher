class Container{
  
  //起動コマンド入力用
  ProcessBuilder prb=null;
  Process proc=null;
  
  PImage img;//アイコン画像
  String title;//タイトル
  int id,w,h,margin;//id , 横幅 , 縦幅 , 余白
  color c;//色
  PVector position;//origin からの距離
 
  
  //変数の初期化(setting , create , delete , log 用)
  Container(){}
  Container(int id,int w,int h,int margin,String img,String title,PVector position){
    this.id=id;
    this.w=w;
    this.h=h;
    this.margin=margin;
    this.title=title;
    this.position=position;
    this.c=color(150,150,150);
    PImage src=loadImage(img);
    this.img=createImage(120,120,ARGB);
    this.img.copy(src,0,0,src.width,src.height,0,0,120,120);
  }
  
  //変数の初期化(container 用)
  Container(int id,int w,int h,int margin,List<String> list,PVector position){
    this.id=id;
    this.w=w;
    this.h=h;
    this.margin=margin;
    this.position=position;
    this.c=color(150,150,150);
    List<String> cmd=new ArrayList<String>();
    for(String s:list)cmd.add(s);//渡されたconfig.txtの項目を行ごとに分割
    try{
      //後ろ4文字が.exeだったら
      
      prb=(cmd.get(2).substring(cmd.get(2).length()-4).equals(".exe"))?
        new ProcessBuilder(cmd.get(2))://.exeとして起動
        new ProcessBuilder(dataPath("processing-4.0.1-windows-x64\\processing-java"),//違かったらprocessingとして起動
          "--sketch="+sketchPath(cmd.get(2)),"--run",cmd.get(3),cmd.get(4));

      //アイコン画像用意
      PImage src=loadImage(cmd.get(1));
      this.img=createImage(120,120,ARGB);
     this.img.copy(src,0,0,src.width,src.height,0,0,120,120); 
     
     this.title=cmd.get(0);//タイトル設定
    }catch(RuntimeException e){
      exception=e.getMessage();
    }

  }
  void setC(color c){this.c=c;}
  void setID(int id){this.id=id;}
  int getID(){return this.id;}
  String getTitle(){return this.title;}
  
  //drawの代わり
  void show(){
    this.body();
    this.img();
    this.hover();
  }
  
  void img(){//画像表示
    fill(255,255,255);
    //origin に position を足した座標から 正方形の形に画像を表示
    image(this.img,origin.x+this.position.x+10,origin.y+this.position.y+10,h-20,h-20);
  }
  void run(){//このアイテムが起動していなかったら
    if(proc==null || proc.isAlive()==false){
      try{
        proc=prb.start();//起動
        manage.getLog().addCount(this.id-1);//このアイテム が 起動したとして log.csv の count に 1 を追加する
      }catch(IOException e){
        exception=e.getMessage();
      };
    }
  }
  
  
  boolean hover(){
    //基準点をこのアイテムの左上に設定
    float x=this.position.x+origin.x;
    float y=this.position.y+origin.y;
    
    //マウスが範囲内に接触したら
    if(mouseX>x&&mouseX<x+this.w &&
      mouseY>y&&mouseY <y+this.h){
      this.c=color(200,200,200);//色を変える
      return true;//trueを返す
      }else this.c=color(150,150,150);//色を変える
      return false;//falseを返す
  }
  void body(){//ボタン表示
    noStroke();
    fill(this.c);
    //四角を表示
    rect(origin.x+this.position.x,origin.y+this.position.y,w,h);
    if(manage.getChange())this.title();//change が true(グリッド表示) だったら タイトルを表示
    
  }
  void title(){
    //タイトル指定
    setFont();
    text(getText(),origin.x+this.position.x+this.w/2,origin.y+this.position.y+this.h/2);
  }
  void setFont(){
    fill(0);
    //フォント指定
    textFont(createFont("Meiryo",30));
  }
  String getText(){
    String title="No."+this.id+":"+this.title;//番号を付けたタイトルを設定
    //文字数が12以上だったら改行して表示
    title=(title.length()>12)?title.substring(0,title.length()/2)+"\n"+title.substring(title.length()/2,title.length()):title;
    return title;
  }
}
