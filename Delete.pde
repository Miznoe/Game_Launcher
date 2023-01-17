class Delete extends Create{
  List<String> name;//登録されている全アイテムのタイトルを保管しておく変数
  Delete(List<String> name){
    this.name=name;
  }
  @Override
  void form(){
    try{
      //セレクトダイアログ
      String select = this.booster.showSelectionDialog(
          "削除したい項目を選択","Delete",this.name);
          
    //ダイアログに項目が入力されたらloadを呼び出す
    if(select!=null)this.load(Integer.parseInt(select.substring(3,select.indexOf(":")).strip())-1,select.substring(select.indexOf(":")+2));
    }catch(Exception e){
      booster.showErrorDialog("削除できる項目がありません\n"+e.getMessage(),"ERROR");
    }
    this.reLoad();//manage を生成しなおす
  }
  void load(int num,String select){
    //num は選んだアイテムにつけた番号 (No.~) が入っている
    //select には選んだアイテムのタイトルが入っている
    
    //config.txtを読み込み
      List<String> line=new ArrayList<String>(Arrays.asList(loadStrings("config.txt")));
    //config.txt の削除対象のタイトルが書かれている行のindex に設定 
      int index=num*6;
    try{
      //削除対象のアイテムを削除
      line.subList(index,index+6).clear();
      //残りの行を config.txt に上書き
      this.write(false,line);
      manage.getLog().removeLog(num);//削除したアイテムをlog.csvからも削除 
    }catch(Exception e){
      exception=e.getMessage()+"err";
    }
  }
  @Override
  void delim(PrintWriter pw){}//削除時は改行文字が不要のため空白でオーバーライドしておく
}
