#Creating base charts with data frames
Pull_SNV <- data.frame(SNV)
Pull_CNV <- data.frame(CNV)
Pull_SV <- data.frame(SVs)

#name check/correction
colnames(Pull_SNV[1])
names(Pull_SNV)[names(Pull_SNV) == 'Shared Column'] <- 'Shared Column'


#merging SNV and CNV 
merge(SNV,CNV, by = "Shared Column", all.x = TRUE, all.y = TRUE )
#framing object
Pull_SNV_CNV_Merge <- data.frame(merge(SNV,CNV, by = "Shared Column", all.x = TRUE, all.y = TRUE ))

#merging SNV+CNV and SV
Pull_SNV_CNV_SV_Merge <- data.frame(merge(Pull_SNV_CNV_Merge, Pull_SV, by = "Shared Column", all.x = TRUE, all.y = TRUE))
#framing object
Master_Pull_2_SNV_CNV_SV_Merge <-data.frame(merge(Master_Pull_2_SNV_CNV_Merge, Master_Pull_2_SV, by = "Shared Column", all.x = TRUE, all.y = TRUE))

#print to excel file
install.packages("writexl")
library("writexl")
write_xlsx(Pull_SNV_CNV_SV_Merge ,"***")

save.image(file = ".RData")

