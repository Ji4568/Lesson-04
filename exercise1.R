###練習1：更大的檔案
#學會了上述過程之後，我們將其應用在原始的大檔案之中，請下載一份資料 “data3_4.csv”。
#這次，除了檔案更大以外，檔案的最後還有參考值。如果你的值位於參考值內，那就是正常，否則則是過高。
#我們這次不要填數值，而是填入正常（TRUE）或異常（FALSE）！
#這個檔案其實跟之前的類似，但欄位有些不同，記得修正部分語法！
dat = read.csv("data3_4.csv", header = TRUE, fileEncoding = 'CP950')
head(dat, 10)

#另外，現在大家開始面臨到極長的迴圈，為了掌握迴圈進度，其實我們可以在迴圈內增加進度條函數，分別是函數「txtProgressBar()」以及函數「setTxtProgressBar()」
#函數「Sys.sleep()」是讓系統休息，你不需要將他加入你的迴圈內

n = 100
pb = txtProgressBar(max = n, style=3)
for(i in 1:n) {
  Sys.sleep(0.1)
  setTxtProgressBar(pb, i)
}
close(pb)

###練習1答案
#注意欄位的不同，有些索引要改！比較好的方式是改成英文名字：
levels.TESTNAME = levels(dat[,'TESTNAME'])
n.TESTNAME = length(levels.TESTNAME)
levels.PATNUMBER = levels(as.factor(dat[,'PATNUMBER']))
n.PATNUMBER = length(levels.PATNUMBER)

final.data = NULL

pb = txtProgressBar(max = n.PATNUMBER, style=3)

for (i in 1:n.PATNUMBER) {
  subdat = dat[dat[,'PATNUMBER']==levels.PATNUMBER[i],]
  subdat[,'COLLECTIONDATE'] = as.factor(as.character(subdat[,'COLLECTIONDATE']))
  levels.COLLECTIONDATE = levels(subdat[,'COLLECTIONDATE'])
  n.COLLECTIONDATE = length(levels.COLLECTIONDATE)
  
  submatrix = matrix(NA, nrow = n.COLLECTIONDATE, ncol = n.TESTNAME+2)
  colnames(submatrix) = c("PATNUMBER", "COLLECTIONDATE", levels.TESTNAME)
  
  submatrix[,1] = levels.PATNUMBER[i]
  submatrix[,2] = levels.COLLECTIONDATE
  
  for (j in 1:n.COLLECTIONDATE) {
    subsubdat = subdat[subdat[,'COLLECTIONDATE']==levels.COLLECTIONDATE[j],]
    for (k in 1:nrow(subsubdat)) {
      NAME = subsubdat[k,'TESTNAME']
      position = which(NAME == levels.TESTNAME) + 2
      VALUE = subsubdat[k,'RESVALUE']
      MINIMUM = subsubdat[k,'MINIMUM']
      MAXIMUM = subsubdat[k,'MAXIMUM']
      if (is.na(MINIMUM)) {MINIMUM = -Inf}
      if (is.na(MAXIMUM)) {MAXIMUM = Inf}
      submatrix[j, position] = (VALUE >= MINIMUM & VALUE <= MAXIMUM)
    }
  }
  
  final.data = rbind(final.data, submatrix)
  
  setTxtProgressBar(pb, i)
  
}

close(pb)

head(final.data)

