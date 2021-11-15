# L07 ex1-1 的参考答案

# ex1-1 完成对单个文件的读入与处理 -----------------------------------------

# 1-1.0：设定文件路径、列示文件并选择一只“样本股”
path <- system.file("extdata", "L07_ex_data", package = "qfwr")
list.files(path)
csv_file <- "300002a.csv"

# 1-1.1: 用 readr::read_csv() 来读入 csv_file，并设定 col_types 参数
out <- read_csv(
  file.path(path, csv_file),  # 连接路径和文件名
  col_names = FALSE,
  col_types = cols(
    X1 = col_double(),
    X2 = col_number(),
    X3 = col_number(),
    X4 = col_double(),
    X5 = col_double()
  )
)
out


View(out)

# 1-1.2: 字段重命名（想想还可以在哪个步骤中直接完成字段重命名任务）
out <- out %>%
  rename(
    pbid = X1,
    qbid = X2,
    cum_qbid = X3,
    cum_fbid = X4,
    pe = X5
  )
out

# 1-1.3: 事后发现有些文档的最后存在有些空行，补充 1-1.3，删除空行
out <- out %>% filter(!is.na(pbid))

# 1-1.4: 查看结果是否正确

out %>% View()
