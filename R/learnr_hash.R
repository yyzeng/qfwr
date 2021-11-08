#' @rdname learnr_hash
#' @name learnr_hash
#'
#' @title **learnr** tutorials' add-on elements for hashing
#'
#' @description
#' 
#' The following functions are modified from Colin Rundel's **learnrhash**, 
#' available at <https://github.com/rundel/learnrhash>, which enable the 
#' encoding, downloading and decoding of hashed answers.
#'
#' Note that when including these functions in a **learnrhash** Rmd document, 
#' it is necessary that the server function `submit_hash_server()` be 
#' included in an R chunk where `context="server"` as they interact with 
#' the underlying Shiny functionality. Conversely, the ui function 
#' `submit_hash_ui()` must _not_ be included in an R chunk with a 
#' `context="server"`.
#' 
#' * `submission_server`
#' 
#' * `submission_ui`
#'
NULL

# @rdname learnr_hash
# 
# @param session Session object from shiny with learnr
# @export
submission_server <- function(session) {
  p = parent.frame()
  
  local({
    output$downloadRDS <- shiny::downloadHandler(
      filename = paste0(learnr::get_tutorial_info()$tutorial_id, 
                        "_answers.rds"),
      content = function(file){
        qfwr:::save_rds(file, session)
      }
    )
  }, envir = p)
}


# @rdname learnr_hash
# 
# @param cid The collect ID of JianguoYun's inbox
# @export
submission_ui <- function(cid = NULL) {
  
  href_jgy <- paste0("https://workspace.jianguoyun.com/inbox/collect/", 
                     cid, "/submit")
  shiny::div(
    shiny::h4("当你完成本讲的练习之后，请按照以下三个步骤的操作完成作业的提交："), 
    shiny::br(), 
    shiny::tags$ol(
      shiny::tags$li("点击按钮", 
                     shiny::downloadButton(outputId = "downloadRDS", 
                                           label = "下载数据"),
                     "［或 右键点击按钮 -> 链接另存为 ...］"), 
      shiny::br(), 
      shiny::tags$li("在弹出窗口中选择将数据文件存在方便管理的文件夹下"), 
      shiny::br(), 
      shiny::tags$li("将下载的", shiny::code(".rds"), "文件上传至",
                     shiny::a("坚果云收件箱", href = href_jgy))
    ), 
    shiny::br()
  )
}

# Save hashed submission object as .rds
#
# @param file    Location to save RDS file
# @param session Session object from shiny with learnr
#
# @return Location of the rds file
# @export
save_rds <- function(file, session) {
  
  state <- learnr::get_tutorial_state(session = session)
  shiny::validate(shiny::need(length(state) > 0, "No progress yet."))

  user_state <- purrr::map_dfr(state, identity, .id = "label")
  user_state <- dplyr::group_by(user_state, .data$label, .data$type, .data$correct)
  user_state <- dplyr::summarize(
    user_state,
    answer = list(.data$answer),
    timestamp = dplyr::first(.data$timestamp),
    .groups = "drop"
  )
  user_state <- dplyr::relocate(user_state, .data$correct, .before = .data$timestamp)
  attr(user_state, "si") <- Sys.info()[-c(6:8)]
  
  saveRDS(qfwr:::encode_obj(user_state), file)
  
  file
}

# Encode an R object into hashed text
#
# @param obj      R object.
# @param compress Compression method.
# 
encode_obj <- function(obj, compress = c("bzip2", "gzip", "xz", "none")) {
  compress = match.arg(compress)
  
  raw = serialize(obj, NULL)
  comp_raw = memCompress(raw, type = compress)
  
  base64enc::base64encode(comp_raw)
}

# Decode hashed text into an R object
# 
# @param txt      Hashed text.
# @param compress Compression method.
#
decode_obj <- function(txt, compress = c("bzip2", "gzip", "xz", "none")) {
  compress = match.arg(compress)
  
  if (txt == "") return(list())
  
  res = try({
    comp_raw = base64enc::base64decode(txt)
    raw = memDecompress(comp_raw, type = compress)
    unserialize(raw)
  }, silent = TRUE)
  
  if (inherits(res, "try-error")) res = list()
  
  res
}

# Decode and extract a hashed colume in a data.frame
# 
# @param df   A data.frame.
# @param hash <data-masking> The hashed column's name.
#  
extract_hash <- function(df, hash) {
  df %>%
    dplyr::rename(hash = {{hash}}) %>%
    dplyr::mutate(
      hash = lapply(hash, decode_obj)
    ) %>%
    tidyr::unnest(hash)
}

