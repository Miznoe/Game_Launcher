class Manage{
  List<Container> list;//アイテム保存用のリスト
  Display disp;
  boolean change;
  Manage(boolean change){//初期化
  //changeの値によってタイル表示かグリッド表示にかわる
    
    this.change=change;
    //configファイル読み込み
    List<String> line=new ArrayList<String>(Arrays.asList(loadStrings("config.txt")));
    
    this.list=new ArrayList<Container>();
    origin=new PVector(150,0);//端からの余白
    int id=0,margin=50,y=150,col=2;//colを変えると行数が変わる
    
    //yは原点(0,0)からの縦方向の距離
    
    int
      w=(change==true)?(int)(width-origin.x*2):200,//changeがtrueなら横長 , false なら正方形
      h=(change==true)?150:200;
    
    try{
      //settingボタンとlogボタンの追加
      this.list.add(new Setting(id,w,h,margin,dataPath("setting.png"),"Setting",new PVector(0,y)));
      this.list.add(new Log(50,60,new PVector(width-100,100)));
      
      y+=h+margin;id++;
      //項目ボタンの追加
      for(int i=0,temp=id%col;i<line.size() &&!(line.get(i).equals(""));i+=6,y+=h+margin,id++,temp=id%col){
        this.list.add(new Container(id,w,h,margin,line.subList(i,i+5),change?new PVector(0,y):new PVector(temp==0?0:(w+margin)*temp,id<col?150:id/col*(h+margin)+150)));//configの行を読み込み
      }
      //背景
      this.disp=new Display(origin,y);
    }catch(ArrayIndexOutOfBoundsException e){
      exception=e.getMessage();
    }catch(IndexOutOfBoundsException e){
      exception=e.getMessage();
    }
  }
  //drawの代わり
  void show(){
    if(exception==null){
      this.disp.show();
      for(Container i:list)i.show();
    }else{
      noStroke();
      fill(255,0,0);
      textFont(createFont("Meiryo",20));
      text(exception,10,50);
    }
  }
  boolean getChange(){return this.change;}
  Display getDisp(){return this.disp;}
  Log getLog(){return (Log)this.list.get(1);}
  List<Container> getContainer(){return this.list;}
  List<String> getTitle(){
    List<String> title=new ArrayList<String>();
    for(int i=2;i<this.list.size();i++)
      title.add("No."+this.list.get(i).getID()+" : "+this.list.get(i).getTitle());
    return title;
  }
}
