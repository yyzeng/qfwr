
# 0. 导入相关R包 ------------------------------------------------------------
library(tidyverse)
library(readxl)
library(lubridate)


# 1. 读入ipos_profile.csv ---------------------------------------------------

# 1.1 获取文件路径
profile <- system.file("extdata", "ipos_profile.zip", package = "qfwr")

# 1.2 以字符形式读入全部内容
ipos_profile <- read_csv(
  profile,   # 文件路径
  col_names = FALSE,
  col_types = cols(.default = col_character()),
  # 若读入错误，则可能还需要设置locale参数的encoding取值，默认是“UTF-8”
  # locale = locale(encoding = "GB18030")
)

# 1.3 逐步进行处理
ipos_profile_sml <- ipos_profile %>%
  select( # 选出需要的变量
    stk_cd = X1,            # 代码
    stk_nm = X2,            # 名称
    ann_date = X4,          # 招股日期
    on_date = X5,           # 网上发行日期
    list_date = X6,         # 上市日期
    list_board = X7,        # 上市板
    issue_method = X49,     # 发行方式
    underwriter = X51,      # 主承销商
    csrc_ind = X63,         # 证监会行业(2012年)
    wind_ind = X65          # Wind行业
  ) %>%
  slice(-c(1, 2, 2413, 2414)) %>%    # 删除第1-2行和最后两行
  type_convert(
    col_types = cols(
      stk_cd = col_character(),
      stk_nm = col_character(),
      ann_date = col_date(format = ""),
      on_date = col_date(format = ""),
      list_date = col_date(format = ""),
      list_board = col_character(),
      issue_method = col_character(),
      underwriter = col_character(),
      csrc_ind = col_character()
    )
  )  # 对全部字符变量进行类型转换


# 2. 读入ipos_rets.xlsx -----------------------------------------------------

# 2.0 加载readxl包
library(readxl)

# 2.1 得到ipos_rets.xlsx的具体路径
rets <- system.file("extdata", "ipos_rets.xlsx", package = "qfwr")

# 2.2 读入文档内容
ipos_rets <- read_excel(
  rets,  # 文档路径
  col_names = FALSE,
  range = "A3:AV2405"  # cellranger::cell_rows(3:2405)
)

# 2.3 逐步进行处理
ipos_rets <- ipos_rets %>%
  select(
    stk_cd = ...1,           # 代码
    ipo_price = ...6,        # 发行价格
    int_return = ...10,      # 上市首日涨跌幅(%)
    int_turnover = ...11,    # 上市首日换手率(%)
    on_lottery = ...41,      # 网上申购中签率(%)
    off_lottery = ...42      # 网下申购中签率(%)
  )

# 3. 合并式连接两个数据集 --------------------------------------------------

# 仅保留在两个数据集中都出现的样本
ipos <- ipos_profile_sml %>%
  inner_join(ipos_rets, by = "stk_cd")

glimpse(ipos)

save(ipos, file = "data/ipos.rda")
