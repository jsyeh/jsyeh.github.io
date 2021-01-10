About 關於 jsyeh.github.io
==========================

這是 葉正聖 的網頁介紹。這裡也會記錄作法, 介紹如何把網站設好。

如何在自己的電腦設定 web server
-------------------------------

1. 先在自己的電腦裡, 下載安裝 xampp
2. 假設 xampp 安裝在 ```C:\xampp```, 那你的網頁就會在 ```C:\xampp\htdocs```
3. 所以修改 ```C:\xampp\htdocs\``` 裡面的 ```index.html``` 或是 ```index.php```, 並試著手動打造網頁
4. 可在 browser 的網址打入 ```localhost``` 便可看到你手動打造的網頁
5. (可選) 如果設定好 https, 在 browser 看網頁時, 網址左方會秀出 安全符號(🔒鎖頭), 不會秀 不安全符號(⚠️危險)
6. (可選) 所以, 要把 xampp 的 https 設定好
4. (可選) 因為我在學校的電腦, 有自己的固定 IP, 所以可利用 IP 直接連到 xampp server
7. (可選) 接著, 買好網址, 把 DNS 設到你的 固定IP, 就可用你買的網址, 連到你的網站

如何將 index.html 放上 jsyeh.github.io
--------------------------------------

若無法架 web server, 可利用 GitHub 的服務 --- 申請 GitHub 帳號, 便可有你專屬的網站網址 ```yourname.github.io```

1. 先建立一個公開的 public repo: 假設你的 GitHub 帳號是 ```jsyeh```, 那你就把 repo 的名字設成 ```jsyeh.github.io```
2. 在 ```jsyeh.github.io``` repo 裡, 新增一個 branch, 名字叫 ```gh-pages``` 代表 **G**it**H**ub網頁, 接著把它設成 ```default branch```
3. 接下來, 便可在自己的電腦裡裝好 Git for Windows 後, 開啟小黑視窗 cmd.exe, 接著打入以下指令
  - ```git clone https://github.com/jsyeh/jsyeh.github.io```
  - 這樣便可把 GitHub 的 repo(倉庫) 複製到你的電腦中, 也就是你電腦多了一個 ```C:\Users\user\jsyeh.github.io``` 的目錄
4. 接下來, 可在上面目錄中, 新增你的 ```index.html```, 並編輯好你的網頁
5. 接下來, 在小黑視窗 cmd.exe 裡, 下指含 ```git add .``` 把你剛剛新增的 ```index.html``` 加到倉庫裡
6. 接下來, 設定 commit (想像成還原點) ```git commit -m "你要commit的訊息像add index.html"```
7. 最後, ```git push``` 便可以把你電腦倉庫裡的檔案, 都 push(推送) 到 github 上面

再來, 稍等一下, 便能在你的 ```jsyeh.github.com``` 看到你剛剛完成的網頁。之後在你的電腦裡 重覆步驟 4,5,6,7  編輯/上傳你的網頁, 就會越做越好。
