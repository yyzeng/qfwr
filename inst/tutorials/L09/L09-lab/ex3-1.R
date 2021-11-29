# ex3-1 的参考答案

# 3-1.1 拆解成多行，每行一个承销商，并存为新数据集 underwriters
#       注：在关于 tidyr 包的 cheatsheet 中可找到个函数轻松实现！
underwriters <- ipos %>%
  select(stk_cd, underwriter) %>%
  separate_rows(underwriter, sep =",") %>%
  arrange(stk_cd)

View(underwriters)
