library(ggplot2)
library(ggpubr)

# data from Martindale
na_salicylate_mw <- 160.1

stock_salicylate_conc <- c(23.2, 46.4, 58, 69.6, 81.2, 92.8)
total_salicylate_conc <- c()

for (value in stock_salicylate_conc) {
  new_conc <- value / 20 / 1000 / na_salicylate_mw * 1000
  total_salicylate_conc <- c(total_salicylate_conc, new_conc)
}

absorbance <- c(0.05, 0.14, 0.17, 0.22, 0.21, 0.21)
salicylate_conc_in_solution <- c()

# y = 280x + 0.0018
# dilution factor of 20 times
for (value in absorbance) {
  conc <- (value - 0.0018) / 280 * 20
  salicylate_conc_in_solution <- c(salicylate_conc_in_solution, conc)
}

solubility_df <- data.frame(
  salicylate_conc_in_solution = salicylate_conc_in_solution,
  total_salicylate_conc = total_salicylate_conc,
  trend = c(rep(c("Upward", "Plateaued"), each = 3))
)

ggplot(
  data = solubility_df,
  aes(x = total_salicylate_conc, y = salicylate_conc_in_solution, color = trend)
) +
geom_point() +
geom_smooth(method = "lm", fullrange = TRUE, se = FALSE) +
stat_regline_equation(label.x = 0.015, label.y.npc = "bottom") +
stat_regline_equation(
  aes(label = after_stat(rr.label)),
  label.x = 0.025,
  label.y.npc = "bottom"
) +
ggtitle(
  "Fig. 2.2 Concentration of Salicylic Acid in Solution vs.
   Total Concentraion of Salicylate Added"
) +
xlab("Total Concentraion of Salicylate Added (M)") +
ylab("Concentration of Salicylic Acid in Solution (M)") +
labs(color = "Trends")

ggsave("fig_2.2.png")

