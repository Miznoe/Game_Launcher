import java.awt.*;
import uibooster.*;
import uibooster.model.*;
import javax.script.*;
import java.io.*;
import java.io.BufferedWriter;
class Setting extends Container{
  UiBooster booster;
  Form form;
  Setting(){//初期化(create , delete , log用)
    this.setBooster();
  }
  //初期化
  Setting(int id,int w,int h,int margin,String img,String title,PVector position){
    super(id,w,h,margin,img,title,position);
    this.setBooster();
  }
  
  void setBooster(){//UiBoosterを初期化(テーマをライトに設定)
    this.booster=new UiBooster(UiBoosterOptions.Theme.LIGHT_THEME);
  }
  @Override
  void run(){//実行されたらdialog を実行
    this.dialog();
  }
  void dialog(){//追加 , 削除 表示切替を選ぶフォームを表示
    this.form=booster.createForm("Setting")
                     .addButton("追加","add",()-> new Create().form())
                     .addButton("削除","Delete",()->new Delete(manage.getTitle()).form())
                     .addButton("表示の切り替え","Change",()->manage=new Manage(manage.getChange()==true?false:true))
                     .andWindow()
                     .setSize(400,300)
                     .save()
                     .run();             
  }
  @Override
  String getText(){
    return this.title;
  }
}
