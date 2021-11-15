# L07 ex2-1 的参考答案

# ex2-1 用 `%>%` 重写 `read_one_csv()` 函数 -------------------------------

read_one_csv2 <- function(csv_file) {
  # s0: 在屏幕输出输出当前循环读到哪个文档
  cat("... read in", csv_file, "now ...\n\n")

  # s1: 读入并操作 csv 文档
  csv_file %>%
    file.path(path, .) %>%     # 连接路径和文件名
    read_csv(
      col_names = FALSE,
      col_types = cols(
        X1 = col_double(),
        X2 = col_number(),
        X3 = col_number(),
        X4 = col_double(),
        X5 = col_double()
      )
    ) %>%
    rename(
      pbid = X1,
      qbid = X2,
      cum_qbid = X3,
      cum_fbid = X4,
      pe = X5
    ) %>%
    filter(!is.na(pbid))
}

read_one_csv2("300002a.csv") %>% View()  # 验证 read_one_csv2() 是否工作正常

# 成功！

