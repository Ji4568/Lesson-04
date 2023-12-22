###練習3：再做一次練習1
#學會了列表物件之後，讓我們再做一次練習1，請在這裡下載資料。
#這次請你學著使用列表特性加速過程！

###練習3答案
#重點是改以列表儲存結果：
levels.TESTNAME = levels(dat[,'TESTNAME'])
n.TESTNAME = length(levels.TESTNAME)
levels.PATNUMBER = levels(as.factor(dat[,'PATNUMBER']))
n.PATNUMBER = length(levels.PATNUMBER)

final.data_list = list() # 改這裡

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
  
  final.data_list[[i]] = submatrix # 改這裡
  
  setTxtProgressBar(pb, i)
  
}

close(pb)


final.data = do.call("rbind", final.data_list) # 改這裡

head(final.data)



