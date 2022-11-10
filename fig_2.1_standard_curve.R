library(ggplot2)
library(ggpubr)

absorbance <- c(0, 0.04, 0.08, 0.18, 0.35, 0.51, 0.63)
salicyate_volume <- c(0, 0.5, 1, 2, 4, 6, 7.5)
salicyate_conc <- c()

for (value in salicyate_volume) {
  conc <- value / 1000 * 0.003 / (10 / 1000)
  salicyate_conc <- c(salicyate_conc, conc)
}

standard_curve_df <- data.frame(
  absorbance = absorbance, concentration = salicyate_conc
)

ggplot(
    data = standard_curve_df, aes(x = concentration, y = absorbance)
  ) +
  geom_smooth(method = "lm", fullrange = TRUE, se = FALSE) +
  geom_point() +
  stat_regline_equation(label.y = 0.5) +
  stat_cor(
    aes(label = after_stat(rr.label)),
    label.y = 0.45,
    label.x.npc = "left"
  ) +
  ggtitle("Fig. 2.1 Standard Curve for Salicyate") +
  xlab("Salicayate Concentration (M)") +
  ylab("Absorbance")

ggsave("fig_2.1.png")
