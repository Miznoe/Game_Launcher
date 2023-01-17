
class Create extends Setting{
  File imgFile,srcFile;
  void form(){
    try{
      //入力ダイアログを表示
      this.form = this.booster.createForm("Add the application")
                              .addText("タイトルを入力","Title")
                              .addButton("画像を選択","Select Image", () -> this.imgFile=this.booster.showFileSelection())
                              .addButton("ファイルを選択","Select File",()->this.srcFile=this.booster.showFileOrDirectorySelection())
                              .addText("width","500")
                              .addText("height","500")
                              .show();
        
        //[画像を選択]が入力されなかったらnotFound.pngを設定
        String img=(this.imgFile!=null)?this.imgFile.getAbsolutePath():dataPath("")+"//notFound.png";
        
        //入力されたデータをString型で取得
        List<String> msg=new ArrayList<String>(Arrays.asList(
            (String)this.form.getElements().get(0).getValue(),
            img,srcFile.getAbsolutePath(),
            (String)this.form.getElements().get(3).getValue(),
            (String)this.form.getElements().get(4).getValue()));
          
        this.write(true,msg);//書き込み
        manage.getLog().setLog(msg.get(0));//log.csv に項目を追加
    }catch(NullPointerException e){
      booster.showErrorDialog("ファイルの選択は必須です","ERROR");
    }
    this.reLoad();//manageを生成し直す
  }
  void write(boolean flag,List<String> msg){
    //flag が true なら追記 false なら上書き
    //msg にはフォームで入力した項目が入っている
    try{
      //追記命令
      PrintWriter pw=new PrintWriter(new FileWriter(dataPath("config.txt"),flag));
      //改行しながら書き込み
      for(String s:msg)pw.println(s);
      //最後の区切り記号を書き込み
      this.delim(pw);
      pw.close();//PrintWriterを閉じる
    }catch(Exception e){
      exception=e.getMessage();
    }
  }
  void delim(PrintWriter pw){
    pw.println("---");//区切り記号を追加
  }
  void reLoad(){
    manage=new Manage(manage.getChange());//現在設定されている boolean の change を manage に渡す
  }
}
