###�m��3�G�A���@���m��1
#�Ƿ|�F�C�����󤧫�A���ڭ̦A���@���m��1�A�Цb�o�̤U����ơC
#�o���ЧA�ǵۨϥΦC���S�ʥ[�t�L�{�I

###�m��3����
#���I�O��H�C���x�s���G�G
levels.TESTNAME = levels(dat[,'TESTNAME'])
n.TESTNAME = length(levels.TESTNAME)
levels.PATNUMBER = levels(as.factor(dat[,'PATNUMBER']))
n.PATNUMBER = length(levels.PATNUMBER)

final.data_list = list() # ��o��

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
  
  final.data_list[[i]] = submatrix # ��o��
  
  setTxtProgressBar(pb, i)
  
}

close(pb)


final.data = do.call("rbind", final.data_list) # ��o��

head(final.data)


