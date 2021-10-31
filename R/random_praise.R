#' @rdname random_praise
#' @name random_praise
#'
#' @title Random praise and encouragement
#'
#' @description
#' 
#' Random praises and encouragements sayings to 
#' compliment your question and quiz experience.
#' 
#' @param code Random praise for coding exercise (`FALSE` by default)
#' @return Character string with a random saying
#'
NULL

#' @rdname random_praise
#' 
#' @export
random_praise_cn <- function(code = FALSE) {
  praise <- c(
    "给你点赞！", 
    "真棒！", 
    "666！", 
    "激情鼓掌！", 
    "针不戳！", 
    "Amazing！", 
    "棒，水土不服就服你！", 
    "棒棒哒！", 
    "大大的赞！", 
    "干得漂亮！", 
    "厉害了我的哥！", 
    "膜拜大神！", 
    "你太太太优秀啦！", 
    "你咋这么厉害呢？！", 
    "你真是个天才！", 
    "漂亮！", 
    "恭喜，答对啦！", 
    "无敌！", 
    "完美！", 
    "Bingo！", 
    "下手千行，倚马可待，赞！", 
    "行云流水般的代码，赞！", 
    "wow，你一个人就仿佛是一个鹅厂！", 
    "赞！代码本天成，妙手偶得之。", 
    "赞！腹有代码气自华。"
  )
  if(code) { # for coding exercise
    return(sample(praise, size = 1))
  }
  else { # for quiz
    return(sample(praise[1:20], size = 1))
  }
}

#' @rdname random_praise
#' 
#' @export
random_encouragement_cn <- function(code = FALSE) {
  encouragement <- c(
    "再接再厉！", 
    "加油！", 
    "加油，坚持就是胜利！", 
    "别灰心，再试一次！", 
    "别气馁，再试一次！", 
    "从容面对失败，终有超越自己的时刻！", 
    "革命尚未成功，同志仍需努力！", 
    "给你力量，再试一次！", 
    "就差一点点，加油！", 
    "加油！世上无难事只要肯登攀。", 
    "再试一次，勇士面前无险路！", 
    "坚持是胜利的秘诀！", 
    "离成功就差辣么一点点🤏", 
    "撸起袖子加油干！", 
    "再来一次，你将比上一秒的你更厉害了。", 
    "失败乃成功之母，别泄气。", 
    "希望你能愈挫愈勇！", 
    "再接再厉哦！", 
    "再试试，马上就要成功啦！", 
    "再试一次吧！", 
    "知不足者好学，耻下问者自满，加油！", 
    "多加练习, 你将会有更大的收获！", 
    "还有一点小错误，加油，你可以的！", 
    "没有关系呀，已经很棒啦继续加油哦。", 
    "学习就是不断犯错的过程，加油！"
  )
  if(code) { # for coding exercise
    return(sample(encouragement, size = 1))
  }
  else { # for quiz
    return(paste0(sample(c("错误。", "选错啦。"), 1), 
                  sample(encouragement[1:20], size = 1)))
  }
}