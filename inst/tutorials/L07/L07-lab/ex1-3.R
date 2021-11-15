# L07 ex1-3 的参考答案

# ex1-3 `for` 循环读入 csv 文档并完成合并 -----------------------------------


# 1-3.1：将 path 路径下满足特定模式的文件名存入字符向量
path <- system.file("extdata", "L07_ex_data", package = "qfwr")
csv_files <- list.files(path, pattern = "[:alnum:]*\\.csv$")   # 记得只包含 .csv 类型的文件
csv_files %>% head(5)   # 看看csv_files向量的内容

# 1-3.2：用 for 循环调用刚定义的 read_one_csv() 逐个读入 csv 文档并将结果存入列表
#        三个步骤：output >> sequence >> body

out_list <- vector("list", length(csv_files))   # 用列表来存储读入的 csv 数据
names(out_list) <- str_sub(csv_files, 1, 6)     # 用 IPO 公司代码（6位数字）给
                                                # out_list 各元素命名

for (i in seq_along(csv_files)) {               # for 循环
  out_list[[i]] <- read_one_csv(csv_files[[i]])
}

View(out_list)   # 看下最终结果如何

# 1-3.3：将 out_list 列表中的64个 tibble 纵向合并，同时生成新的字段 stkcd，用来
#        标识具体是哪家 IPO 公司的网下申报数据
#        dplyr 包中竟然有个函数可一步完成，找到它！
out_tb <- out_list %>% bind_rows(.id = "stkcd")

View(out_tb)

# 噢耶！成功！

