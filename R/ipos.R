#' Chinese inital public offerings data from Chinese stock markets
#'
#' A dataset containing inital public offerings (IPOs) from Chinese
#' stock markets (2006-01-01 - 2019-09-30)
#'
#' @format A tibble with 2390 rows and 15 varialbes:
#' \describe{
#'   \item{\code{stk_cd}}{IPO's stock code}
#'   \item{\code{stk_nm}}{IPO's stock name}
#'   \item{\code{ann_date}}{IPO's announcement date}
#'   \item{\code{on_date}}{IPO's online subscription date}
#'   \item{\code{list_date}}{IPO's list date}
#'   \item{\code{list_board}}{IPO's list board, such as Main, SME, Chinext and STAR}
#'   \item{\code{issue_method}}{IPO's issuing method}
#'   \item{\code{underwriter}}{IPO's underwriter}
#'   \item{\code{csrc_ind}}{IPO's CSRC industry code}
#'   \item{\code{wind_ind}}{IPO's Wind industry code}
#'   \item{\code{ipo_price}}{IPO's issuing price, in CNY}
#'   \item{\code{int_return}}{IPO's initial return, in %}
#'   \item{\code{int_turnover}}{IPO's initial turnover, in % }
#'   \item{\code{on_lottery}}{IPO's online subscription lottery rate, in %}
#'   \item{\code{off_lottery}}{IPO's offline subscription lottery rate, in %}
#' }
#'
#' @source Wind Financial Terminal, \url{http://www.wind.com.cn}
"ipos"
