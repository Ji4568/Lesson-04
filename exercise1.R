###�m��1�G��j���ɮ�
#�Ƿ|�F�W�z�L�{����A�ڭ̱N�����Φb��l���j�ɮפ����A�ФU���@����� ��data3_4.csv���C
#�o���A���F�ɮק�j�H�~�A�ɮת��̫��٦��ѦҭȡC�p�G�A���Ȧ��ѦҭȤ��A���N�O���`�A�_�h�h�O�L���C
#�ڭ̳o�����n��ƭȡA�ӬO��J���`�]TRUE�^�β��`�]FALSE�^�I
#�o���ɮר��򤧫e�������A����즳�Ǥ��P�A�O�o�ץ������y�k�I
dat = read.csv("data3_4.csv", header = TRUE, fileEncoding = 'CP950')
head(dat, 10)

#�t�~�A�{�b�j�a�}�l���{�췥�����j��A���F�x���j��i�סA���ڭ̥i�H�b�j�餺�W�[�i�ױ���ơA���O�O��ơutxtProgressBar()�v�H�Ψ�ơusetTxtProgressBar()�v
#��ơuSys.sleep()�v�O���t�Υ𮧡A�A���ݭn�N�L�[�J�A���j�餺

n = 100
pb = txtProgressBar(max = n, style=3)
for(i in 1:n) {
  Sys.sleep(0.1)
  setTxtProgressBar(pb, i)
}
close(pb)

###�m��1����
#�`�N��쪺���P�A���ǯ��ޭn��I����n���覡�O�令�^��W�r�G
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
