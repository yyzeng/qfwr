# L06 EX5 的参考答案

# IPO 网上申购中签率的时序变化
ipos %>% ggplot(aes(x = on_date, y = on_lottery)) +
  geom_point(
    aes(color = list_board),
    alpha = 1/5
  ) +
  labs(x = "网上发行日期", y = "网上申购中签率(%)", color = NULL) +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y") +
  scale_y_log10(breaks = c(0.1, 1, 3, 10)) +
  theme(legend.position = "bottom")

# IPO 网上申购中签率和网下申购中签率的关系及其变动
ipos %>% ggplot(aes(x = on_lottery, y = off_lottery)) +
  geom_abline(color = "white", size = 2) +
  geom_point(
    aes(color = as.character(lubridate::year((ann_date)))),
    alpha = 1/3
  ) +
  labs(x = "网上申购中签率(%)", y = "网下申购中签率(%)", color = NULL) +
  scale_x_log10(breaks = c(0.01, 0.1, 1, 10, 100), limits = c(0.001, 100)) +
  scale_y_log10(breaks = c(0.01, 0.1, 1, 10, 100), limits = c(0.001, 100)) +
  scale_fill_distiller(palette = "Spectral") +
  coord_equal(ratio = 1)

# IPO 网上申购中签率和首日收益率的关系及其变动
ipos %>% ggplot(aes(x = on_lottery, y = int_return)) +
  geom_point(
    aes(color = as.character(lubridate::year((list_date)))),
    alpha = 1/3
  ) +
  labs(x = "网上申购中签率(%)", y = "首日收益率(%)", color = NULL) +
  scale_x_log10(breaks = c(0.01, 0.1, 1, 10, 100), limits = c(0.001, 100)) +
  scale_fill_distiller(palette = "Spectral")

