#' qfwr: A package providing tutorials and helper tools for QFwR course.
#'
#' @description
#' Tutorials and helper tools for my course _Quantitative Finance with R_ 
#' to facilitate teaching and learning. The interactive exercise is powered
#' by RStudio's **learnr**, **gradethis** and some ideas stolen 
#' from Prof. Rundel's **learnrhash**.
#'
#' @author
#' Yongyi Zeng (\email{zzyy@@xmu.edu.cn})
#'
#' @references
#' \itemize{
#'     \item \href{http://r4ds.had.co.nz/}{R for Data Science}
#'     \item \href{https://jrnold.github.io/r4ds-exercise-solutions/}{R for Data Science: Exercise Solutions}
#'     \item \href{https://item.jd.com/12398129.html}{R数据科学}
#'     \item \href{https://item.jd.com/12069905.html}{量化金融R语言初级教程}
#' }
#'
#' @docType package
#' @name qfwr
NULL

#' Run an interactive exercise in package **qfwr**.
#'
#' Run an interactive exercise which is contained within R package 
#' **qfwr**. `qfwr_ex()` is just a simple wrapper of
#' \code{learnr::\link[learnr]{run_tutorial}}.
#'
#' @param lecture An string, such as "L05".
#'
#' @return An interactive exercise opened in web browser.
#'
#' @examples
#' \dontrun{
#' qfwr_ex("L05")
#' }
#'
#' @name qfwr_ex
#'
#' @export
qfwr_ex <- function(lecture) {
  learnr::run_tutorial(lecture, package = "qfwr")
}


#' List all interactive exercises in package **qfwr**.
#'
#' List all interactive exercises which are contained within
#' R package **qfwr**. `qfwr_ls()` is a wrapper of
#' \code{learnr::\link[learnr]{available_tutorials}}.
#'
#' @return An invisible data.frame containing "package", "name", 
#' "title", "description", "package_dependencies", "private", 
#' and "yaml_front_matter".
#'
#' @examples
#' \dontrun{
#' qfwr_ls()
#' }
#'
#' @name qfwr_ls
#'
#' @export
qfwr_ls <- function() {
  suppressWarnings(learnr::available_tutorials("qfwr"))
}


#' Open an hands-on lab's instruction in code editor.
#'
#' @param lecture An string, such as "L05".
#'
#' @return An invisible character vector containing the path of the 
#' hands-on lab's instruction RMarkdown file \code{L##-lab.Rmd}.
#'
#' @examples
#' \dontrun{
#' qfwr_lab("L05")
#' }
#'
#' @name qfwr_lab
#' 
#' @importFrom utils file.edit
#' 
#' @export
qfwr_lab <- function(lecture = NULL) {
  lab <- system.file("tutorials", lecture, paste0(lecture, "-lab"),
                     paste0(lecture, "-lab", ".Rmd"),
                     package = "qfwr")
  if (lab == "") stop("The specified lab's instruction Rmd file don't exist.")
  file.edit(lab, fileEncoding = "UTF-8")
  invisible(lab)
}


#' Open an hands-on lab exercise's answer key in code editor.
#'
#' @param lecture  An string, such as "L05".
#' @param exercise An string, such as "ex1".
#'
#' @return An invisible character vector containing the path of 
#' the answer key file \code{ex#.R}.
#'
#' @examples
#' \dontrun{
#' qfwr_key("L05", "ex1")
#' }
#'
#' @name qfwr_key
#'
#' @export
qfwr_key <- function(lecture = NULL, exercise = NULL) {
  ans_key <- system.file("tutorials", lecture, paste0(lecture, "-lab"),
                         paste0(exercise, ".R"),
                         package = "qfwr")
  if (ans_key == "") stop("The specified answer key file don't exist.")
  file.edit(ans_key, fileEncoding = "UTF-8")
  invisible(ans_key)
}
