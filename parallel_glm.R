set.seed(1)

n <- 10^3
m <- 10^3
p <- 50


X <- matrix(rnorm(n*p), nrow=n,ncol=p)
Y <- matrix(rpois(n*m, lambda=3), nrow=n, ncol=m)

start <- Sys.time() 
Beta.1 <- apply(Y, 2, function(y) {
  fit <- glm(y ~ ., data = as.data.frame(X), 
             family=poisson())
  fit$coefficients
})
end <- Sys.time()

cat("Normal: ", difftime(end,start, units="sec"), " seconds \n")

library(parallel)

cat("Num of cores: ", detectCores(), "\n")

start <- Sys.time() 
Beta.2 <- do.call(cbind, mclapply(1:ncol(Y), function(j) { 
  fit <- glm(Y[, j] ~ ., data = as.data.frame(X), family = poisson())
  fit$coefficients
}, mc.cores = detectCores() - 1))  # Use all but one core

end <- Sys.time()
cat("Multicore: ", difftime(end,start, units="sec"), " seconds \n")

identical(Beta.1, Beta.2)
