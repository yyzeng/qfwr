#' @importFrom rlang .data
NULL

#' @importFrom magrittr %>%
#' @export
magrittr::`%>%`

.onAttach <- function(libname, pkgname) {
  packageStartupMessage(
    paste0('\n',
           '=================================================\n',
           '  Welcome to Quantitative Finance with R.\n',
           '     Yongyi Zeng, <zzyy@xmu.edu.cn>\n\n',
           '  Start doing exercise by: \n',
           '    qfwr_ls()       # list all exercises\n',
           '    qfwr_ex("L05")  # "L05" is for Lecture 05\n',
           '=================================================',
           '\n'
    )
  )
}
