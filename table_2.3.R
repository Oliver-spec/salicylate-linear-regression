caffeine_stock_vol <- c(0.8,
                        1.0,
                        1.2,
                        1.5,
                        2.0,
                        2.5,
                        3.3,
                        4.1,
                        5.0,
                        6.0,
                        6.8,
                        7.5,
                        8.2,
                        9.0,
                        10.0,
                        11.5,
                        12.5,
                        13.8,
                        15.0)
sal_stock_vol <- c(rep(1, 19))
h2so4_vol <- c(18.2, 18.0, 17.8, 17.5, 17.0, 16.5, 15.7, 14.9, 14.0, 13.0, 12.2,
               11.5, 10.8, 10.0, 9.0, 7.5, 6.5, 5.2, 4.0)
caffeine_conc <- caffeine_stock_vol / c(rep(20, 19))
sal_conc <- sal_stock_vol / c(rep(20, 19))

table_2.3 <- data.frame(caffeine_stock_vol = caffeine_stock_vol,
                        sal_stock_vol = sal_stock_vol,
                        h2so4_vol = h2so4_vol,
                        caffeine_conc = caffeine_conc,
                        sal_conc = sal_conc)

write.csv(table_2.3, 'table_2.3.csv', row.names = FALSE)