class Log extends Setting{
  List<String[]> temp;//log.csvに項目を追加する際に使用
  String[][] log;//log.csv の内容を保存
  Log(int w,int h,PVector position){//初期化
    this.position=position;
    this.w=w;this.h=h;
    this.c=color(150,150,150);
    PImage src=loadImage("Log.png");
    this.img=createImage(120,120,ARGB);
    this.img.copy(src,0,0,src.width,src.height,0,0,120,120); 
    
    try{
      //log.csv の内容を log へ読み込み
      List<String> line=new ArrayList<String>(Arrays.asList(loadStrings("log.csv")));
      this.log=new String[line.size()][2];
      for(int i=0;i<line.size();i++){
        this.log[i][0]=line.get(i).split(",")[0];
        this.log[i][1]=line.get(i).split(",")[1];
      }
      //log をリストに変換
      this.temp=new ArrayList<String[]>(Arrays.asList(this.log));
    }catch(Exception e){}
    
  }
  void addCount(int index){//アイテムを起動した際に count を +1 する用
    int count=Integer.parseInt(this.log[index][1]);
    this.log[index][1]=String.valueOf(++count);
  }
  //log.csv にアイテムを追加
  void setLog(String title){
    this.temp.add(new String[]{title,"0"});
    this.listToArray();
    writeLog();
  }
  //log.csv からアイテムを削除
  void removeLog(int index){
    this.temp.remove(index);
    this.listToArray();
    writeLog();
  }
  //リストのtemp を 配列のlog に変換
  void listToArray(){
    this.log=this.temp.toArray(new String[0][0]);
    for(String[] str:log)println(str[0]+","+str[1]);
    
  }
  //log.csv に書き込み
  void writeLog(){
    try{
      PrintWriter pw=new PrintWriter(new FileWriter(dataPath("log.csv"),false));
      for(String[] a:log)pw.println(a[0]+","+a[1]);
      pw.close();
    }catch(Exception e){exception=e.getMessage()+"aaa";}
  }
  @Override
  boolean hover(){
    //このアイテムの上にマウスカーソルが来たら
    //色を変える & boolean を返す
    float x=this.position.x;
    float y=this.position.y;
    if(mouseX>x&&mouseX<x+this.w &&
      mouseY>y&&mouseY <y+this.h){
      this.c=color(200,200,200);
      return true;
      }else this.c=color(150,150,150);
      return false;
  }
  @Override
  void body(){
    //四角 & 四角の上に画像を表示
    fill(this.c);
    rect(this.position.x-10,this.position.y,70,this.h);
    image(this.img,this.position.x,this.position.y,this.w,this.h);
  }
  @Override
  void dialog(){//log.csv に登録されたアイテムを表にして表示
    this.booster.showTableImmutable(
      this.log,
      Arrays.asList("Title","Start Count"),
      "Log"
    );
  }
}
