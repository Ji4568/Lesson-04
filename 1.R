###第一節：資料轉換概念(1)
#資料轉換的重點只有一個，那就是先想好目標格式，接著利用迴圈功能一格一格把目標格式的資料填滿
#當然，之後也許你會看到一些函數能加速整個流程，但在面對小筆資料時熟練的使用迴圈能幫忙我們迅速做完資料轉換
#現在我們遇到了上一份資料的加強版，請下載它 “data3_3.csv”
#這份資料是從三軍總醫院生化檢驗值系統截取某10位病患在這段期間內所測得之各式生化值
dat = read.csv("data3_3.csv", header = TRUE, fileEncoding = 'CP950')
head(dat, 10)

#資料轉換概念(2)
#現在這筆資料在轉換時有2個維度，分別是「個案」及「測量時間」，我們在最開始規畫的時候要先把東西盡可能拆離成小部分，最後再用迴圈功能一口氣全部做完
#一樣，先取得這份資料的基本資訊
levels.TESTNAME = levels(as.factor(dat[,3]))
levels.TESTNAME

n.TESTNAME = length(levels.TESTNAME)
n.TESTNAME

levels.PATNUMBER = levels(as.factor(dat[,1]))
levels.PATNUMBER

n.PATNUMBER = length(levels.PATNUMBER)
n.PATNUMBER

#資料轉換概念(3)
#我們只先做一個個案，之後再想辦法利用迴圈把它全部都做完就好
#在寫迴圈時，我習慣先在起頭令迴圈變數為1，如果這段以後能執行，那應該整個迴圈都不會有問題

#我們先把個案1的資料先切割出來
i = 1
subdat = dat[dat[,1]==levels.PATNUMBER[i],]
#接著，我們再取得subdat中的一些資訊，主要就是他總共測了幾次
levels.COLLECTIONDATE = levels(as.factor(subdat[,2]))
n.COLLECTIONDATE = length(levels.COLLECTIONDATE)
n.COLLECTIONDATE

#有沒有發現他好像測量太多次了？這是因為我們將檔案切割成subdat時，第二欄的因子向量仍然記得他以前有多少個類別，因此我們要先把它的記憶洗掉。洗掉的方法有很多種，如先轉換成文字向量，再轉換回因子向量
subdat[,2] = as.factor(as.character(subdat[,2]))
levels.COLLECTIONDATE = levels(subdat[,2])
n.COLLECTIONDATE = length(levels.COLLECTIONDATE)
n.COLLECTIONDATE

#資料轉換概念(4)
#接著，我們先建立一個矩陣讓我們填資料
#第一欄填ID，第二欄填上這個人所有測量的時間點

submatrix = matrix(NA, nrow = n.COLLECTIONDATE, ncol = n.TESTNAME+2)
colnames(submatrix) = c("PATNUMBER", "COLLECTIONDATE", levels.TESTNAME)

submatrix[,1] = levels.PATNUMBER[i]
submatrix[,2] = levels.COLLECTIONDATE

head(submatrix)

#接著，我們開始能一個時間點一個時間點分析了，我們能把subdat在切割出更細的subsubdat
#同樣的，我們先看第一個時間點，注意迴圈變數不要重複，所以剛剛設i，這次我們設j

j = 1
subsubdat = subdat[subdat[,2]==levels.COLLECTIONDATE[j],]
subsubdat

#資料轉換概念(5)
#我們需要這份小資料中每列都執行下列的事項
#找出這列是描述哪個生化值
#找出在submatrix中這個生化值的位置
#把value填入那個位置
#同樣，我們可以再開一個迴圈執行這個部分，這次這個迴圈的迴圈變數命為k
#函數「which()」可以幫我們找位置

k = 1
NAME = subsubdat[k,3]
NAME

position = which(NAME == levels.TESTNAME) + 2 
position

submatrix[j, position] = subsubdat[k,4]
head(submatrix)

#資料轉換概念(6)
#現在，我們可以將要對subsubdat中所做的事情打包成一個迴圈如下，這樣第一個時間點就完成了
#subsubdat #先看看subsubdat裡面有哪些

for (k in 1:nrow(subsubdat)) {
  NAME = subsubdat[k,3]
  position = which(NAME == levels.TESTNAME) + 2
  submatrix[j, position] = subsubdat[k,4]
}
head(submatrix)

#資料轉換概念(7)
#由於這是一個人中一個時間點的迴圈，我們可以把一整個迴圈打包在另一個迴圈之下
for (j in 1:n.COLLECTIONDATE) {
  subsubdat = subdat[subdat[,2]==levels.COLLECTIONDATE[j],]
  for (k in 1:nrow(subsubdat)) {
    NAME = subsubdat[k,3]
    position = which(NAME == levels.TESTNAME) + 2
    submatrix[j, position] = subsubdat[k,4]
  }
}

head(submatrix)

