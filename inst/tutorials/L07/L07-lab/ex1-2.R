# L07 ex1-2 的参考答案

# ex1-2 自定义函数 -----------------------------------------------------


# 获取文件路径，该步骤无需放入函数体中
path <- system.file("extdata", "L07_ex_data", package = "qfwr")

# 定义函数 read_one_csv()
read_one_csv <- function(csv_file) {
  # s0: 在控制台上输出当前循环读到哪个文档
  cat("... read in", csv_file, "now ...\n\n")

  # s1: 用 readr::read_csv() 来读入 csv_file，并设定 col_types 参数
  out <- read_csv(
    file.path(path, csv_file),   # 连接路径和文件名
    col_names = FALSE,
    col_types = cols(
      X1 = col_double(),
      X2 = col_number(),
      X3 = col_number(),
      X4 = col_double(),
      X5 = col_double()
    )
  )

  # s2: 字段重命名（想想还可以在哪个步骤中直接完成字段重命名任务）
  out <- out %>%
    rename(
      pbid = X1,
      qbid = X2,
      cum_qbid = X3,
      cum_fbid = X4,
      pe = X5
    )

  # s3: 事后发现有些文档的最后有些空行，补充s3，删除空行
  out %>% filter(!is.na(pbid))

}

read_one_csv("300002a.csv") %>% View()  # 验证 read_one_csv() 是否工作正常

