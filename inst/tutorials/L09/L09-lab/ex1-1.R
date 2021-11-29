# ex1-1 的参考答案
# 条条大路通罗马，列出的只是参考答案而已

# 1-1.1 调整因子次序并制图
#       注：尽管 fct_*() 函数的第一个参数多为 f（因子向量），但它们多数也可直接
#           作用于字符型向量
ipos %>%
  mutate(  # 记得 fct_*() 应在 mutate() 内
    list_board = fct_relevel(
      list_board, "主板", "中小企业板", "创业板")
    ) %>%
  ggplot(aes(x = list_board)) +
  geom_bar(fill = "darkgrey", width = 0.6) +
  labs(x = NULL, y = "num of IPOs")
