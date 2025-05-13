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
sim <- fetch_datasus(year_start = 2023, month_start = 10, year_end = 2023, month_end = 12, uf = "SC", information_system = "SIM-DO")
sim <- process_sim(sim)

# Dados do SIA

sia <- fetch_datasus(year_start = 2023, month_start = 10, year_end = 2023, month_end = 12, uf = "SC", information_system = "SIA-PA")


#### SE ERRRO

URL="ftp://ftp.datasus.gov.br/dissemin/publicos/SIASUS/200801_/Dados/"

download.file(paste0(URL, ''))