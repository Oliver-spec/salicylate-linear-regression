library(ggplot2)
library(ggpubr)

log_Ks <- c(1.392,
            1.698,
            1.666,
            1.602)

one_over_T <- c(0.003225806,
                0.003352330,
                0.003322259,
                0.003267974)

df <- data.frame(log_Ks = log_Ks, one_over_T = one_over_T)

ggplot(data = df, aes(x = one_over_T, y = log_Ks)) +
  geom_smooth(method = "lm", fullrange = TRUE, se = FALSE) +
  geom_point() +
  stat_regline_equation(label.y = 1.25) +
  stat_cor(
    aes(label = after_stat(rr.label)),
    label.y = 1,
    label.x.npc = "left"
  ) +
  ggtitle("Fig. 2.5 Plot of log Ks vs. 1 / T with regression line equation") +
  xlab("1 / T (K^-1)") +
  ylab("log Ks")

ggsave('fig_2.5.png')
