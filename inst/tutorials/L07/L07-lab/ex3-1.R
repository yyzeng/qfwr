# L07 ex3-1 的参考答案

# ex3-1 用列表列的方法合并64个 csv 文档 --------------------------------

# 3-1.1: 首先将符合条件的文件名存为 tibble 对象的 stkcd 列
path <- system.file("extdata", "L07_ex_data", package = "qfwr")
out_tb3 <- tibble(stkcd = list.files(path, pattern = "*\\.csv$"))

# 3-1.2: 将 csv 文档读入为列表列 data
out_tb3 <- out_tb3 %>%
  mutate(data = map(stkcd, read_one_csv2))
View(out_tb3)

# 3-1.3：修改 stkcd 变量并解嵌套 data 列表列
out_tb3 <- out_tb3 %>%
  mutate(stkcd = str_sub(stkcd, 1, 6)) %>%
  unnest(cols = data)

# 查看结果是否OK？
View(out_tb3)

# 成功！

