# ex2 的参考答案

# 2.1 先看看 wind_ind 的行业划分情况
ipos %>%
  count(wind_ind, sort = TRUE) %>%
  View()

# 2.2 提取（保留） wind_ind 的第一级行业分类并制图
#     条条大路通罗马，但限制使用 mutate() + str_*() 的方法
ipos %>%
  mutate(wind_ind1 = str_extract(wind_ind, "^[^-]+")) %>%
  ggplot(aes(fct_infreq(wind_ind1))) +   # 按频率从高到低自左向右排序
  geom_bar() +
  labs(x = "Wind Industry Code", y = "num of IPOs")

# 注意：从图示结果看有三个 IPO 的 Wind 行业取值为 NA
