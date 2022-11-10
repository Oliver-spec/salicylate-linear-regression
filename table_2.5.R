df <- read.csv('table_2.3.csv')

part <- c(1:19)
sal_conc <- df$sal_conc
caffeine_conc <- df$caffeine_conc
abs <- c(  # upward
  0.23, 0.22, 0.24, 0.25, 0.26, 0.24, 0.27,
  # plateaued
  0.3, 0.25, 0.28, 0.29, 0.3, 0.28, 0.29, 0.29,
  # downward
  0.27, 0.23, 0.19, 0.18)
dissolved_sal_conc <- abs / rep(280, 19) * rep(20, 19)

table_2.5 <- data.frame(part = part, 
                        sal_conc = sal_conc,
                        caffeine_conc = caffeine_conc, 
                        abs = abs, 
                        dissolved_sal_conc = dissolved_sal_conc)

write.csv(table_2.5, 'table_2.5.csv', row.names = FALSE)
