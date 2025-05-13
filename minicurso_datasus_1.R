setwd('~/Documents/aulas/minicurso_datasus/')

rm(list = ls())
gc()

if (!require("remotes")) install.packages("remotes")
if (!require("read.dbc")) install.packages("read.dbc", repos = "https://packagemanager.posit.co/cran/2024-07-05")
if (!require("microdatasus")) remotes::install_github("rfsaldanha/microdatasus")

sisSIH <- c("SIH-RD", "SIH-RJ", "SIH-SP", "SIH-ER")
sisSIM <- c("SIM-DO", "SIM-DOFET", "SIM-DOEXT", "SIM-DOINF", 
            "SIM-DOMAT")
sisSINASC <- c("SINASC")
sisCNES <- c("CNES-LT", "CNES-ST", "CNES-DC", "CNES-EQ", 
             "CNES-SR", "CNES-HB", "CNES-PF", "CNES-EP", "CNES-RC", 
             "CNES-IN", "CNES-EE", "CNES-EF", "CNES-GM")
sisSIA <- c("SIA-AB", "SIA-ABO", "SIA-ACF", "SIA-AD", "SIA-AN", 
            "SIA-AM", "SIA-AQ", "SIA-AR", "SIA-ATD", "SIA-PA", "SIA-PS", 
            "SIA-SAD")
sisSINAN <- c("SINAN-DENGUE", "SINAN-CHIKUNGUNYA", "SINAN-ZIKA", 
              "SINAN-MALARIA", "SINAN-CHAGAS", "SINAN-LEISHMANIOSE-VISCERAL", 
              "SINAN-LEISHMANIOSE-TEGUMENTAR", "SINAN-LEPTOSPIROSE")

# Dados do SIM-DO
# Dados do SIM-DO
sim <- fetch_datasus(year_start = 2023, month_start = 10, year_end = 2023, month_end = 12, uf = "SC", information_system = "SIM-DO")
sim <- process_sim(sim)
head(sim)
colnames(sim)
table(sim$SEXO)
prop.table(table(sim$SEXO))
barplot(table(sim$SEXO), main = 'Óbito por Sexo', ylab = 'número', xlab = 'sexo', col = c('hotpink', 'navy'))

cid10_cama <- 'C50'

sim_mama <- sim[grep('C50', sim$CAUSABAS_O), ]
sim_mama$CAUSABAS_O
summary(sim_mama$IDADE)
sim_mama$DTNASC <- as.Date(sim_mama$DTNASC, format = "%Y-%m-%d")
sim_mama$DTOBITO <- as.Date(sim_mama$DTOBITO, format = "%Y-%m-%d")
sim_mama$AGE <- round(as.numeric(difftime(sim_mama$DTOBITO, sim_mama$DTNASC, units = 'days'))/365.25, 1)
summary(sim_mama$AGE)

hist(sim_mama$AGE)

write.csv(sim, file = 'SIM_SC_2023.csv')

# Dados do SIA
sia <- fetch_datasus(year_start = 2023, month_start = 10, year_end = 2023, month_end = 10, uf = "SC", information_system = "SIA-PA")

head(sia)

sia_mmg <- sia[grep('020403018', sia$PA_PROC_ID), ]
head(sia_mmg)