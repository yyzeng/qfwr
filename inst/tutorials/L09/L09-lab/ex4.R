# ex4 的参考答案

# IPO 月度发行家数的 时间序列柱形图
# （基于网上发行日期 on_date 统计）
ipos %>%
  count(month = floor_date(on_date, unit = "month")) %>%
  ggplot(aes(month, n)) +
  geom_bar(stat = "identity") +
  labs(x = NULL, y = "num of IPOs") +
  scale_x_date(breaks = "1 years", date_labels = "%Y-%m")
