###�m��2�G����S3����榡
#�ڭ̤w�g�Ƿ|�p��N�Q�n����T��b�C��(list)���󤤡A�óz�L�N�o�Ӫ����ഫ���@�ӯS�w��S3����(S3 class) ��A�N�i�H�z�L�ۭq��ơuprint.XXX()�v�e�{�Q�n�����G�C
#�ڭ̲{�b�Ʊ���o�ӦC���ରS3����A�åB���L����X�אּ�o�خ榡�G

Test_list = list(student = c('�p��', '�p��', '�p�R'),
                 score = c(80, 90, 75))

Test_list

#���]�A�Ƿ|�F�s�gS3����A���������XTest_list�N�|�X�{�U�C�y�z�G
Test_list

###�m��2����
#S3��������b��G
#���w�@�Ӫ���W��
#�s�g�S�w���uprint�v���

Test_list = list(student = c('�p��', '�p��', '�p�R'),
                 score = c(80, 90, 75))

class(Test_list) = 'My_list'

print.My_list = function(Test_list) {
  for (i in 1:length(Test_list[[1]])) {
    cat(Test_list[[1]][i], "�����Ƭ�", Test_list[[2]][i], "\n")
  }
}

Test_list