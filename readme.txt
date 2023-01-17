これはGameLauncherの説明書です。
このアプリケーションではProcessingで作った作品の追加・削除ができます。

追加方法
(1) 次の命令をあなたのプロジェクトの setup() 内に追加してください。

if(args!=null)surface.setSize(int(args[0]),int(args[1]));

(2) GameLauncher を起動し、setting -> add の順に押します。
(3) 表示されるダイアログの項目を入力した後 ok を押します。
(4) エラーがなければ GameLauncher 内に作品が追加されます。

削除方法
(1) GameLauncher を起動し、setting -> delete を押します。
(2) 表示されるダイアログから削除したい項目を選択し OK を押します。
(3) エラーがなければ作品が削除されています。