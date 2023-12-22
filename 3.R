###第三節：用列表特性加速任務(1)
#上一節我們有發現了函數「rbind」對記憶體很不友善的！
#讓我們做個小測試，假設我們不斷的將一個完全相同的資料表用rbind指令合併，和先使用列表儲存，看看時間差異有多大：
#這是連續合併1000次的耗時：

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
final_dat = NULL

for (i in 1:1000) {
  
  final_dat = rbind(final_dat, base_dat)
  
}

Sys.time() - t0 #用現在時間減去開始時間

#這是連續合併2000次的耗時：

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
final_dat = NULL

for (i in 1:2000) {
  
  final_dat = rbind(final_dat, base_dat)
  
}

Sys.time() - t0 #用現在時間減去開始時間

#這是連續合併4000次的耗時：

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
final_dat = NULL

for (i in 1:4000) {
  
  final_dat = rbind(final_dat, base_dat)
  
}

Sys.time() - t0 #用現在時間減去開始時間

#用列表特性加速任務(2)
#讓我們用列表來解決這個問題吧！
#這是連續合併1000次的耗時：

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
dat_list = list()

for (i in 1:1000) {
  
  dat_list[[i]] = base_dat
  
}

Sys.time() - t0 #用現在時間減去開始時間

#這是連續合併2000次的耗時：

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
dat_list = list()

for (i in 1:2000) {
  
  dat_list[[i]] = base_dat
  
}

Sys.time() - t0 #用現在時間減去開始時間

#這是連續合併4000次的耗時：

t0 = Sys.time()

base_dat = data.frame(X = rnorm(20), Y = rnorm(20))
dat_list = list()

for (i in 1:4000) {
  
  dat_list[[i]] = base_dat
  
}

Sys.time() - t0 #用現在時間減去開始時間

