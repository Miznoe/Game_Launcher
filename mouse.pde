
//画面スクロール
void mouseWheel(MouseEvent event){
  float f=event.getCount();
  Display d=manage.getDisp();
  if(f<0 &&d.getY()<50)d.setY(50);//下方向にスクロール
  if(f>0 &&d.getY()>d.getH())d.setY(-50);//上方向にスクロール
}

//ボタンクリック反応
void mousePressed(){
  switch(mouseButton){
    case LEFT://左クリックしたら起動
    for(Container i:manage.getContainer())
      if(i.hover()){i.setC(color(120,120,120));i.run();}
  }
}
