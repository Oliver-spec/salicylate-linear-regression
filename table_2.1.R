absorbance <- c(0.04, 0.08, 0.18, 0.35, 0.51, 0.63)
salicyate_volume <- c(0.5, 1, 2, 4, 6, 7.5)
salicyate_conc <- c()

for (value in salicyate_volume) {
  conc <- value / 1000 * 0.003 / (10 / 1000)
  salicyate_conc <- c(salicyate_conc, conc)
}

Molar_absorptivity <- absorbance / salicyate_conc

standard_curve_df <- data.frame(
  Salicylate_Conc = salicyate_conc, vol_stock_soln = salicyate_volume, 
  Absorbance = absorbance, Molar_absorptivity = Molar_absorptivity
)

avg_molar_absorptivity <- mean(Molar_absorptivity)

write.csv(standard_curve_df, 'table_2.1.csv', row.names = FALSE)