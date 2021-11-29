# ex3-2 的参考答案

# 3-2.1 先统一提取前四位字符作为承销商简称
udw_tmp <- underwriters %>%
  mutate(undwrt = underwriter %>% str_sub(1, 4))
# mutate(undwrt = str_sub(underwriter, 1, 4))

# 3-2.2 再看下 undwrt 变量的取值及其*倒序*频数分布情况
udw_tmp %>%
  count(undwrt) %>%
  arrange(desc(n)) %>%  # 也可在前一步骤中设定参数 sort = TRUE 从而跳过此步骤
  View()

# 3-2.3 手工调整更改几处明显不太恰当的券商简称，如：
#       中国国际（中金公司）|中国银河（银河证券）|中国中投（中投证券）
#       中国民族（民族证券）|太平洋证（太平洋证券）|新时代证（新时代证券）
#       摩根士丹（摩根士丹利）| 长江巴黎（长江证券）
udwrs <- udw_tmp %>%
  mutate(
    undwrt = str_replace_all( # ?str_replace_all
      undwrt,
      c(
        "中国国际" = "中金公司",
        "中国银河" = "银河证券",
        "中国中投" = "中投证券",
        "中国民族" = "民族证券",
        "太平洋证" = "太平洋证券",
        "新时代证" = "新时代证券",
        "摩根士丹" = "摩根士丹利",
        "长江巴黎" = "长江证券"
      )
    )
  )

# 3-2.4 再看下 undwrt 变量的取值及其倒序频数分布情况
udwrs %>%
  count(undwrt) %>%
  arrange(desc(n)) %>%
  View()
