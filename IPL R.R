library(mongolite)
ipl_collection <- mongo(collection = "IPL", db = "TechNovate", url = "mongodb://localhost:27017")
ipl_analysis <- ipl_collection$find()
print(ipl_analysis)

colSums(is.na(ipl_analysis))  # Count missing values per column

ipl_analysis <- na.omit(ipl_analysis)

ipl_analysis$Win_Margin[is.na(ipl_analysis$Win_Margin)] <- mean(ipl_analysis$Win_Margin, na.rm = TRUE)

ipl_analysis <- ipl_analysis[!duplicated(ipl_analysis), ]

print(ipl_analysis)

write.csv(ipl_analysis, "C:/Users/yasha/Downloads/clean_data.csv",row.names=FALSE)





