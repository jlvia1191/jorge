# lsm2.R

#' @title Estimation of the log Likelihood of the Saturated Model
#' @description When the values of the outcome variable Y are either 0 or 1, the function lsm() calculates the estimation of the log likelihood in the saturated model. This model is characterized by Llinas (2006, ISSN:2389-8976) in section 2.3 through the assumptions 1 and 2. If Y is dichotomous and the data are grouped in J populations, it is recommended to use the function lsm() because it works very well for all K.

#' @param formula An expression of the form y ~ model, where y is the outcome variable (binary or dichotomous: its values are 0 or 1).
#' @param data an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which lsm() is called.
#' @return  lsm2 returns an object of class "lsm2".
#' An object of class "lsm2" is a list containing at least the #' following components:
#'
#' log_Likelihood:    Estimation of the log likelihood.
#' populations:   Total number J of populations in the model.
#'  z_j    : Value of Zj (the sum of the observations in the jth population).

#' @details The saturated model is characterized by the assumptions 1 and 2 presented in section 2.3 by Llinas (2006, ISSN:2389-8976).
#' @references [1] Humberto Jesus Llinas. (2006). Accuracies in the theory of the logistic models. Revista Colombiana De Estadistica,29(2), 242-244.
#' @references [2] Hosmer, D. (2013). Wiley Series in Probability and Statistics Ser. : Applied Logistic Regression (3). New York: John Wiley & Sons, Incorporated.
#' @author Humberto Llinas Solano [aut], Universidad del Norte, Barranquilla-Colombia \\ Omar Fabregas Cera [aut], Universidad del Norte, Barranquilla-Colombia \\ Jorge Villalba Acevedo [cre, aut], Unicolombo, Cartagena-Colombia.
#'@examples
#' # Hosmer, D. (2013) page 3: Age and coranary Heart Disease (CHD) Status of 20 subjects:
#'
#' AGE <- c(20, 23, 24, 25, 25, 26, 26, 28, 28, 29, 30, 30, 30, 30, 30, 30, 30, 32, 33, 33)
#' CHD <- c(0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)
#'
#'  data <- data.frame (CHD, AGE)
#' lsm2(CHD ~ AGE , data)
#'
#' # Other case.
#'
#'y	<- c(0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 1)
#'  x1 <- c(2, 2, 2, 2,	2, 5, 5, 5, 5, 6, 6, 6, 8, 8, 11, 11, 11, 1)
#'  x2 <- c(3, 3, 3, 3,	3, 6,	6, 6, 6, 8, 8, 8, 9, 9, 12,	12,	12,	12)
#'  x3 <- c(4, 4, 4, 4,	4, 7,	7, 7, 7, 9, 9, 9, 10, 10, 13,	13,	13,	13)
#'  x4 <- c(1, 1, 1, 1,	1, 9,	9, 9, 9, 10, 10, 10, 4, 4, 2, 2, 2, 2)
#'  x5 <- c(32, 32, 32, 32, 32, 20, 20, 20, 20, 21, 21, 21, 19, 19, 16, 16, 16, 16)
#'  x6 <- c(15, 15, 15, 15, 15, 18, 18, 18, 18, 16, 16, 16, 25, 25, 20, 20, 20, 20)
#'  x7 <- c(28, 28, 28, 28, 28, 23, 23, 23, 23, 32, 32, 32, 24, 24, 32, 32, 32, 32)
#'  x8 <- c(0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0)
#'  x9 <- c(6, 6, 6, 6, 6, 10, 10, 10, 10, 11, 11, 11, 7, 7, 21, 21, 21, 21)
#'  x10 <- c(5, 5, 5, 5, 5, 6, 6, 6, 6, 7, 7, 7, 7, 7, 8, 8, 8, 8)
#'
#'  data <- data.frame (y, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10)
#'  lsm2(y ~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10, data)
#'
#' ## For more ease, use the following notation.
#'  lsm2(y~., data)
#'
#' ## Other case.
#'
#'   y <- as.factor(c(1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 1))
#'  x1 <- as.factor(c(2, 2, 2, 5, 5, 5, 5, 8, 8, 11, 11, 11))
#'  x2 <- as.factor(c(3, 3, 3, 6, 6, 6, 6, 9, 9, 12, 12, 12))
#'  x3 <- as.factor(c(4, 4, 4, 7, 7, 7, 7, 10, 10, 13, 13, 13))
#'  x4 <- as.factor(c(1, 1, 1, 9, 9, 9, 9, 4, 4, 2, 2, 2))
#'  x5 <- as.factor(c(5, 5, 5, 6, 6, 6, 6, 7, 7, 8, 8, 8))
#'
#'  data <- data.frame (y, x1, x2, x3, x4, x5)
#'  lsm2(y ~ x1 + x2 + x3 + x4 + x5, data)
#'
#' ## For more ease, use the following notation.
#'  lsm2(y~., data)
#'
#' @export
#' @import stats

<<<<<<< HEAD:R/lsm.R
lsm<- function(formula , data )
{
  mf <- model.frame(formula = formula, data = data)

  res <-do.call(rbind, (tapply(as.vector(mf[, 1]), t(apply((mf[, -1,drop =FALSE]), 1, paste0,collapse = "-")),function(x) c(z = sum(as.numeric(x)), n = length(as.numeric(x)),p = mean(as.numeric(x))))))
  zj<- res[, 1]
  nj <- res[, 2]; pj <- res[, 3]; vj <- pj*(1-pj); mj <- nj*pj;
  Vj <- nj*vj
  V <- diag(vj);colnames(V) <- names(Vj);rownames(V) <- names(Vj);
  sp <- as.matrix((zj - nj * pj)/vj); ip <- diag(nj/vj); Zj <- (zj - nj*pj)/sqrt(nj*vj)
  sj <- (res[, 1] * log(res[, 3]) + (res[, 2] - res[, 1]) * log(1 - res[, 3]))
  Lj <-ifelse((res[, 3]) == 0 | (res[, 3]) == 1, 0, sj)
  sat <- sum (Lj)
  r<-list(log_Likelihood = sat, populations = length(res) / 3,z_j = as.matrix(zj), n_j = nj, p_j = pj, fitted.values = Lj, v_j = vj, m_j = as.matrix(mj), V_j = Vj, V = V, S_p = sp, I_p = ip, Zast_j = as.matrix(Zj))

  r$call <- match.call()
  class(r) <- "lsm"
  return(r)

}

print.lsm <- function(x, ...)
{
  cat("\nCall:\n")
  print(x$call)
  cat("\nLog_Likelihood: \n")
  print(x$log_Likelihood)
  cat("\nPopulations: \n")
  print(x$populations)
}
=======
lsm.default <- function(formula , data )
{
  mf <- model.frame(formula = formula, data = data)

  res <-do.call(rbind, (tapply(as.vector(mf[, 1]), t(apply((mf[, -1,drop =FALSE]), 1, paste0,collapse = "-")),function(x) c(z = sum(as.numeric(x)), n = length(as.numeric(x)),p = mean(as.numeric(x))))))
  zj<- res[, 1]; nj <- res[, 2]; pj <- res[, 3]; vj <- pj*(1-pj); mj <- nj*pj; Vj <- nj*vj; V <- diag(vj);sp <- as.matrix((zj - nj * pj)/vj); ip <- diag(nj/vj); Zj <- (zj - nj*pj)/sqrt(nj*vj)
  sj <- (res[, 1] * log(res[, 3]) + (res[, 2] - res[, 1]) * log(1 - res[, 3]))
  Lj <-ifelse ((res[, 3]) == 0 | (res[, 3]) == 1, 0, sj)
  sat <- sum(Lj)
  r <- list(log_Likelihood = sat, populations = length(res) / 3,z_j = as.matrix(zj), n_j = nj, p_j = pj, fitted.values = Lj, v_j = vj, m_j = as.matrix(mj), V_j = Vj, V = V, S_p = sp, I_p = ip, Zast_j = as.matrix(Zj)  )
}


lsm2 <- function(formula , data)
{

  est <- lsm.default(formula , data)

  est$call <- match.call()
  class(est) <- "lsm"
  est
}

print.lsm2 <- function(x, ...)
{
  cat("\nCall:\n")
  print(x$call)
  cat("\nLog_Likelihood: \n")
  print(x$log_Likelihood)
  cat("\nPopulations: \n")
  print(x$populations)
}


>>>>>>> 0d21a14403f6ae5961d44550e29fce94cb1af28e:R/lsm2.R







