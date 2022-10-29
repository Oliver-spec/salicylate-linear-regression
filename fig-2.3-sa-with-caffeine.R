library(ggplot2)
library(ggpubr)
library(httpgd)

absorbance <- c(
  # upward
  0.23, 0.22, 0.24, 0.25, 0.26, 0.24, 0.27,
  # plateaued
  0.3, 0.25, 0.28, 0.29, 0.3, 0.28, 0.29, 0.29,
  # downward
  0.27, 0.23, 0.19, 0.18
)
salicylate_conc_in_solution <- c()

# y = 280x + 0.0018
# dilution factor of 20 times
for (value in absorbance) {
  conc <- (value - 0.0018) / 280 * 20
  salicylate_conc_in_solution <- c(salicylate_conc_in_solution, conc)
}

stock_caffeine_added <- c(
  0.8, 1, 1.2, 1.5, 2, 2.5, 3.3, 4.1, 5, 6, 6.8,
  7.5, 8.2, 9, 10, 11.5, 12.5, 13.8, 15
)
caffeine_conc <- c()

for (value in stock_caffeine_added) {
  conc <- value / 1000 * 0.08 / (20 / 1000)
  caffeine_conc <- c(caffeine_conc, conc)
}

solubility_df <- data.frame(
  salicylate_conc_in_solution = salicylate_conc_in_solution,
  caffeine_conc = caffeine_conc,
  Trends = c(rep(c("Upward", "Plateaued", "Downward"), c(7, 8, 4)))
)

graph <- ggplot(
  data = solubility_df,
  aes(x = caffeine_conc, y = salicylate_conc_in_solution, color = Trends)
) +
geom_point() +
geom_smooth(method = "lm", fullrange = TRUE, se = FALSE) +
stat_regline_equation(label.x = 0.02, label.y.npc = "bottom") +
stat_regline_equation(
  aes(label = after_stat(rr.label)),
  label.x.npc = "center",
  label.y.npc = "bottom"
) +
ggtitle(
  "Fig. 2.3 Concetration of Salicylic Acid vs. Concentration of Caffeine"
) +
xlab("Concentration of Caffeine (M)") +
ylab("Concentration of Salicylic Acid (M)")

hgd()
hgd_browse()

plot(graph)
