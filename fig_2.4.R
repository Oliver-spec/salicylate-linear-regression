library(ggplot2)
library(ggpubr)

log_S0 <- c(-1.824,
            -1.932,
            -1.886,
            -1.845)

one_over_temp <- c(0.003225806, 
          0.003352330,
          0.003322259,
          0.003300330)

df <- data.frame(log_S0 = log_S0, one_over_temp = one_over_temp)

ggplot(data = df, aes(x = one_over_temp, y = log_S0)) +
  geom_smooth(method = "lm", fullrange = TRUE, se = FALSE) +
  geom_point() +
  stat_regline_equation(label.y = -1.87) +
  stat_cor(
    aes(label = after_stat(rr.label)),
    label.y = -1.9,
    label.x.npc = "left"
  ) +
  ggtitle("Fig. 2.4 Plot of log S0 vs. 1 / T with regression line equation") +
  xlab("1 / T (K^-1)") +
  ylab("log S0")

ggsave('fig_2.4.png')
  
