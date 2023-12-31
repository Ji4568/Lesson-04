###第二節：列表(List)層物件基本介紹(1)
#到目前為止，我們並不十分注意任務消耗時間，但你應該發現上一個任務所消耗的時間非常的誇張，我們似乎沒有甚麼好方法解決這個問題
#如果你有注意到的話，迴圈運行速度其實是越來越慢，這個問題其實是出在我們的函數「rbind」，這個函數雖然能夠方便的把兩個資料表合併成一個，但他的過程其實對記憶體很不友善的！
#為了解決這個問題，讓我們先學一個新的物件格式：列表
#列表(List)層分為列表(list)、S3物件(S3 class)及S4物件(S4 class):
#1.列表(list)：在R裡面，向量的上層是陣列層物件。若是我們希望在一個物件內放置很多陣列層物件，我們會用到列表。???得一提的是，列表裡面可以同時包含數個陣列層物件及變數層物件。

#2.S3物件(S3 class)：S3物件是一種特殊的列表物件，他的變化會在後面慢慢介紹。

#3.S4物件(S4 class)：S4物件與前面兩種有非常大的不同，相關的函數也不一樣，在本節課我們不會教到。

#我們首先介紹列表(list)物件
# 先產生一個數???矩陣物件
x1 = 1:20
M1 = matrix(x1, nrow = 4, ncol = 5)
M1

# 再產生一個文字矩陣物件
x2 = c("A", "B", "C", "A", "C", "B", "B", "B", "A")
M2 = matrix(x2, nrow = 3, ncol = 3)
M2

# 再產生一個邏輯向量
x3 = c(TRUE, FALSE, TRUE, FALSE)
x3

# 將上述這些物件打包成一個列表物件
L1 = list(M1, M2, x3)
L1

#列表(List)層物件基本介紹(2)
#列表(List)層物件中有幾個重要的函數來描述它的基本資料：
#1.函數「length()」可以協助我們了解物件長度

#2.函數「class()」可以查詢該物件的屬性

#3.函數「names()」可以協助我們命名物件

#4.函數「ls()」可以協助我們看看物件中有哪些東西

length(L1)

class(L1)

names(L1) = c("A", "B", "C")
L1

ls(L1)

#列表(List)層物件基本介紹(3)
#在R裡面所有的索引函數都由中括號形成，列表(List)層物件中的索引函數是使用[[]]，我們直接在中括號內填入數字就好。另外，索引函數「$」一樣能用在陣列層的物件
L1[[2]]

L1[["B"]]

L1$B

#如果我們想要進一步再找藏在L1裡面的B裡面的元素，我們可以繼續使用索引函數
L1[[2]][2,3]

L1[["B"]][3,1]

L1$B[1,2]

#列表(List)層物件基本介紹(4)
#經過了上述的示範後，我們了解到列表(list)是一個很方便的物件，它可以把很多很雜的東西丟在同個物件內。但東西多了以後會遇到問題，那就是該列表物件會變的非常非常大，但也許我們想要呈現的東西是很有限的，在R裡面，列表有一種擴展型態叫做S3物件(S3 class)，它可以解決這個問題。
#S3物件(S3 class)的產生方式如下

#先看看L1的樣子
L1

#先看看L1的物件屬性
class(L1)

#強迫L1成為別的物件屬性
class(L1) = "test"
#再看看L1的物件屬性
class(L1)

#看看L1現在的樣子
L1

#小提示：當你使用函數「class()」可以查詢該物件的屬性，若非常見的幾種屬性名稱，那就非常有可能是S3物件(S3 class)或S4物件(S4 class)

#列表(List)層物件基本介紹(5)
#轉變為S3物件(S3 class)後，我們可以透過自訂函數「print.XXX()」、自訂函數「summary.XXX()」等函數來讓R知道要如何呈現這個S3物件
#先寫一個自訂函數「print.test()」
print.test = function(test) {
  cat("此列表共有",length(test),"個物件\n")
  cat("物件名稱分別為：\n")
  cat(paste(names(test), collapse = ", "), "\n")
}

#再看看請R列印出L1會變什麼
L1

#列表(list)的幾個常見函數還是能夠使用：

ls(L1)

length(L1)

class(L1)

names(L1) = c("D", "E", "F")
L1

#列表(List)層物件基本介紹(6)
#接著我們還能寫自訂函數「summary.XXX()」來呈現更詳細的資料
#在寫之前我們先看看直接對L1使用函數「summary()」會怎樣

summary(L1)

#現在我們可以讓函數「summary()」使用後產生不同的結果

#先寫一個自訂函數「summary.test()」
summary.test = function(test) {
  cat("此列表共有",length(test),"個物件\n")
  cat("物件名稱分別為：\n")
  cat(paste(names(test), collapse = ", "), "\n")
  for (i in 1:length(test)) {
    cat(names(test)[i], "之物件屬性為", class(test[[i]]), "\n")
  }
}

#再看看使用函數「summary()」後會變什麼
summary(L1)



