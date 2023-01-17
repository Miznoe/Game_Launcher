import java.io.File;
import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.Collections;
import java.lang.ProcessBuilder;
import java.io.InputStreamReader;
Manage manage;
String exception;
PVector origin;
void setup() {
  size(800,700);//画面サイズ
  if(args!=null)surface.setSize(int(args[0]),int(args[1]));//ランチャーからランチャーを起動した際のサイズ設定用
  //manageを生成
  //初期ではグリッド表示(true)
  manage=new Manage(true);
}
void draw() {
  manage.show();//manageを呼び出し(drawの替わり)
}
@Override
void exit(){//終了時にlog.csvをセーブ
  manage.getLog().writeLog();
}
