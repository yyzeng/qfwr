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
    "给你点赞！&#x1F44D;", 
    "真棒！", 
    "666！", 
    "激情鼓掌！&#x1F44F;", 
    "针不戳！", 
    "Amazing！", 
    "棒，水土不服就服你！", 
    "棒棒哒！", 
    "大大的赞！", 
    "干得漂亮！", 
    "厉害了我的哥！&#x1F60D;", 
    "膜拜大神！&#x1F9CE;", 
    "你太太太优秀啦！", 
    "你咋这么厉害呢？！", 
    "你真是个天才！&#x1F607;", 
    "漂亮！&#x1F3AF;", 
    "恭喜，答对啦！", 
    "无敌！&#x1F947;", 
    "完美！&#x1F4AF;", 
    "Bingo！", 
    "下手千行，倚马可待，赞！", 
    "行云流水般的代码，&#x1F44D;！", 
    "wow，你一个人就仿佛是一个鹅厂！", 
    "赞！代码本天成，妙手偶得之。", 
    "赞！腹有代码气自华。&#x1F607;"
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
    "再接再厉！&#x1F3C6;", 
    "加油！&#x1F4AA;", 
    "加油，坚持就是胜利！&#x23F3;", 
    "别灰心，再试一次！", 
    "别气馁，再试一次！", 
    "从容面对失败，终有超越自己的时刻！&#x1F389;", 
    "革命尚未成功，同志仍需努力！&#x1F91D;", 
    "给你力量，再试一次！", 
    "就差一点点，加油！&#x26F3;", 
    "加油！世上无难事只要肯登攀。&#x1F3D4;&#xFE0F;", 
    "再试一次，勇士面前无险路！&#x1F5F3;&#xFE0F;", 
    "坚持是胜利的秘诀！", 
    "离成功就差辣么一点点&#x1F90F;", 
    "撸起袖子加油干！&#x1F6E0;&#xFE0F;", 
    "再来一次，你将比上一秒的你更厉害了。", 
    "失败乃成功之母，别泄气。", 
    "希望你能愈挫愈勇！", 
    "再接再厉哦！", 
    "再试试，马上就要成功啦！&#x1F451;", 
    "再试一次吧！&#x1F647;", 
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
