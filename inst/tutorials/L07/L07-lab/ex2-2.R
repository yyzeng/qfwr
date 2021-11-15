# L07 ex2-2 的参考答案

# ex2-2 用函数式编程方法来替代练习#1中的 `for` 循环 -------------------------

# 2-2.1: 首先还是将满足条件的文件名存入字符向量
path <- system.file("extdata", "L07_ex_data", package = "qfwr")
csv_files <- list.files(path, pattern = "*\\.csv$")

# 2-2.2：应用 purrr 包中的函数读入 csv 文档，得到数据集列表
out_list2 <- csv_files %>%
  map(read_one_csv2)   # sooo easy!

# 2-2.3：将 out_list2 列表中的64个数据集纵向合并，同时用字段 stkcd 标识
#        具体是哪家 IPO 公司，但需先用 csv 文件名给 out_list2 命名，purrr 包
#        中有个函数可完成这一任务，找到它
out_tb2 <- out_list2 %>%
  set_names(str_sub(csv_files, 1, 6)) %>%   # 此步给 out_list2 命名
  bind_rows(.id = "stkcd")

# 看看是否OK？
out_tb2 %>% View()

# 成功！

