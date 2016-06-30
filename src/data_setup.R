load("/opt/raid10/genomics/data/lincs/L1000/cloudAPI_a2/SigInfo/sigInfo.update_12-03-2014.RData")
sh.cgs<- subset(sigInfo.update, pert_type == "trt_sh.cgs")
keeps <- c("cell_id","pert_desc","pert_time","dn100_bing","dn100_full","dn50_lm","up100_bing","up100_full","up50_lm")
KO_data <- sh.cgs[,keeps]

save(KO_data,  file = "KO_data.rda")
tools::resaveRdaFiles("/home/vandersm/Documents/KO_data.rda", compress = c("auto"))

for (i in 1:nrow(KO_data)){
  KO_data$affy_up100_bing[i] <- strsplit(KO_data$up100_full[i], ";")
  KO_data$affy_down100_bing[i] <- strsplit(KO_data$dn100_full[i], ";")
  KO_data$affy_up100_full[i] <- strsplit(KO_data$up100_bing[i], ";")
  KO_data$affy_down100_full[i] <- strsplit(KO_data$dn100_bing[i], ";")
  KO_data$affy_up50_lm[i] <- strsplit(KO_data$up50_lm[i], ";")
  KO_data$affy_down50_lm[i] <- strsplit(KO_data$dn50_lm[i], ";")
}

keeps <- c("cell_id","pert_desc","pert_time","affy_up100_bing","affy_down100_bing","affy_up100_full","affy_down100_full","affy_up50_lm","affy_down50_lm")
KO_data <- KO_data[,keeps]
save(KO_data,  file = "KO_data.rda")
tools::resaveRdaFiles("KO_data.rda", compress = c("auto"))

conversion_key <- suppressMessages(AnnotationDbi::select(hgu133a.db::hgu133a.db, AnnotationDbi::keys(hgu133a.db), c("SYMBOL","ENTREZID"), "PROBEID"))

for (i in 1:nrow(KO_data)){
  KO_data$symbol_up100_bing[i] <- list(conversion_key$SYMBOL[which(conversion_key$PROBEID %in% unlist(KO_data$affy_up100_bing[i]))])
  KO_data$symbol_down100_bing[i] <- list(conversion_key$SYMBOL[which(conversion_key$PROBEID %in% unlist(KO_data$affy_down100_bing[i]))])
  KO_data$symbol_up100_full[i] <- list(conversion_key$SYMBOL[which(conversion_key$PROBEID %in% unlist(KO_data$affy_up100_full[i]))])
  KO_data$symbol_down100_full[i] <- list(conversion_key$SYMBOL[which(conversion_key$PROBEID %in% unlist(KO_data$affy_down100_full[i]))])
  KO_data$symbol_up50_lm[i] <- list(conversion_key$SYMBOL[which(conversion_key$PROBEID %in% unlist(KO_data$affy_up50_lm[i]))])
  KO_data$symbol_down50_lm[i] <- list(conversion_key$SYMBOL[which(conversion_key$PROBEID %in% unlist(KO_data$affy_down50_lm[i]))])
}

save(KO_data,  file = "KO_data.rda")
tools::resaveRdaFiles("KO_data.rda", compress = c("auto"))
