###�ĤT�`�G�ΦC���S�ʥ[�t����(1)
#�W�@�`�ڭ̦��o�{�F��ơurbind�v��O����ܤ��͵����I
#���ڭ̰��Ӥp���աA���]�ڭ̤��_���N�@�ӧ����ۦP����ƪ���rbind���O�X�֡A�M���ϥΦC���x�s�A�ݬݮɶ��t�����h�j�G
#�o�O�s��X��1000�����ӮɡG

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
final_dat = NULL

for (i in 1:1000) {
  
  final_dat = rbind(final_dat, base_dat)
  
}

Sys.time() - t0 #�β{�b�ɶ���h�}�l�ɶ�

#�o�O�s��X��2000�����ӮɡG

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
final_dat = NULL

for (i in 1:2000) {
  
  final_dat = rbind(final_dat, base_dat)
  
}

Sys.time() - t0 #�β{�b�ɶ���h�}�l�ɶ�

#�o�O�s��X��4000�����ӮɡG

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
final_dat = NULL

for (i in 1:4000) {
  
  final_dat = rbind(final_dat, base_dat)
  
}

Sys.time() - t0 #�β{�b�ɶ���h�}�l�ɶ�
