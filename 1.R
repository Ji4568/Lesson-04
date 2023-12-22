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


