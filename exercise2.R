###練習2：善用S3物件格式
#我們已經學會如何將想要的資訊放在列表(list)物件中，並透過將這個物件轉換為一個特定的S3物件(S3 class) 後，就可以透過自訂函數「print.XXX()」呈現想要的結果。
#我們現在希望能把這個列表轉為S3物件，並且讓他的輸出改為這種格式：

Test_list = list(student = c('小明', '小華', '小愛'),
                 score = c(80, 90, 75))

Test_list

#假設你學會了編寫S3物件，那直接打出Test_list將會出現下列描述：
Test_list

###練習2答案
#S3物件的關鍵在於：
#指定一個物件名稱
#編寫特定的「print」函數

Test_list = list(student = c('小明', '小華', '小愛'),
                 score = c(80, 90, 75))

class(Test_list) = 'My_list'

print.My_list = function(Test_list) {
  for (i in 1:length(Test_list[[1]])) {
    cat(Test_list[[1]][i], "的分數為", Test_list[[2]][i], "\n")
  }
}

Test_list
