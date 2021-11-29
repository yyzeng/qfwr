# ex3-3 的参考答案

# 3-3.1 计算主承销商承销家数
#       计算方法如下：
#       假如一只 IPO 只有1家主承销商，则给该主承销商 +1，有2家主承销商，则
#       每家各 +1/2，以此类推。没整明白具体怎么算，那也别慌！我已经帮你们
#       算好啦，:) 代码如下：
undwrt_ipos <- udwrs %>%
  group_by(stk_cd) %>%
  mutate(ipo_share = 1/n()) %>%
  group_by(undwrt) %>%
  summarise(ipos = sum(ipo_share)) %>%
  arrange(desc(ipos))

# 3-3.2 将承销家数处于15位之后的券商合并为“其它券商”组（记得设置权重 w 参数），
#       重新按因子变量 undwrt 统计 IPO 承销家数，并作条形图（作图前记得调整
#       变量 undwrt 的因子次序）
undwrt_ipos %>%
  mutate(  # 将承销家数处于15位之后的券商合并为“其它券商”组
    undwrt = fct_lump_n(undwrt, n = 15, w = ipos, other_level = "其它券商")
  ) %>%
  count(undwrt, wt = ipos) %>%
  mutate(  # 调整变量 undwrt 的因子次序，可能需要两次调整
    undwrt = undwrt %>% fct_reorder(n) %>% fct_relevel("其它券商")
  ) %>%
  ggplot(aes(x = n, y = undwrt)) +
  geom_bar(stat = "identity") +
  labs(x = "num of IPOs", y = "Underwriter")

