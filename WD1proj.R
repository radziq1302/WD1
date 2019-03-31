data_bp <- read.csv("bp_hist_hour.csv", header = FALSE)
data_md <- read.csv("md_hist_hour.csv", header = FALSE)
data_tr <- read.csv("tr_hist_hour.csv", header = FALSE)


data_bp<-cbind(0:23, data_bp)
data_md<-cbind(0:23, data_md)
data_tr<-cbind(0:23, data_tr)
library(ggplot2)
aaa<-ggplot(data, aes(x=as.factor(data$`0:23`), y=data$V1))+geom_bar(stat="identity", width = 0.9, fill="steelblue", position = position_dodge(width = 1.9) )+
  geom_text(aes(label=data$V1), vjust=-1, color="black", size=3.5)+scale_x_discrete()+
  theme_minimal() + labs(x='godzina', y='liczba wiadomoœci', title = 'Liczba wiadomoœci dziennie w podziale na godziny')

aaa1<-ggplot(data, aes(x=data$`0:23`, y=data$V1))+geom_line(size=2, color='steelblue')+
  geom_point(size=3, color='navy')+
  theme_minimal() + labs(x='godzina', y='liczba wiadomoœci', title = 'Liczba wiadomoœci dziennie w podziale na godziny')
library(gridSVG)

bp_hour<-ggplot(data_bp, aes(x=data_bp$`0:23`, y=data_bp$V1))+geom_line(size=2, color='steelblue')+
  geom_point(size=3, color='navy')+
  theme_minimal() + labs(x='godzina', y='liczba wiadomoœci', title = 'Liczba wiadomoœci dziennie w podziale na godziny')
md_hour<-ggplot(data_md, aes(x=data_md$`0:23`, y=data_md$V1))+geom_line(size=2, color='steelblue')+
  geom_point(size=3, color='navy')+
  theme_minimal() + labs(x='godzina', y='liczba wiadomoœci', title = 'Liczba wiadomoœci dziennie w podziale na godziny')
tr_hour<-ggplot(data_tr, aes(x=data_tr$`0:23`, y=data_tr$V1))+geom_line(size=2, color='steelblue')+
  geom_point(size=3, color='navy')+
  theme_minimal() + labs(x='godzina', y='liczba wiadomoœci', title = 'Liczba wiadomoœci dziennie w podziale na godziny')
aaa1

svg("md_hour1.svg", height = 7.5, width = 8)
md_hour

dev.off()
svg("bp_hour.svg", height = 7.5, width = 8)
bp_hour
dev.off()
svg("tr_hour.svg", height = 7.5, width = 8)
tr_hour
dev.off()
data_xd<-read.csv("xds_counts.csv")
bp_data_xd<-read.csv("bp_xds_counts.csv")
md_data_xd<-read.csv("md_xds_counts.csv")
tr_data_xd<-read.csv("tr_xds_counts.csv")
bp_data_xd<-bp_data_xd[1:12,]
md_data_xd<-md_data_xd[1:12,]
tr_data_xd<-tr_data_xd[1:12,]


bbb<-ggplot(data_xd, aes(x=reorder(data_xd$xd,-data_xd$X1800), y=data_xd$X1800))+geom_bar(stat="identity", width = 0.8, fill="steelblue", position = position_dodge(width = 1.9) )+
  geom_text(aes(label=data_xd$X1800), vjust=-1, color="black", size=3.5)+scale_x_discrete()+
  theme_minimal() + labs(x='godzina', y='liczba wiadomoœci', title = 'Liczba wiadomoœci dziennie w podziale na godziny')
bbb



bp_xd<-ggplot(bp_data_xd, aes(x=reorder(bp_data_xd$xD,-bp_data_xd$X22136), y=bp_data_xd$X22136))+geom_bar(stat="identity", width = 0.8, fill="steelblue", position = position_dodge(width = 1.9) )+
  geom_text(aes(label=bp_data_xd$X22136), vjust=-1, color="black", size=3.5)+scale_x_discrete()+
  theme_minimal() + labs(x='Typ xd', y='liczba wiadomoœci', title = 'Suma xd  wed³ug typu') +theme(axis.text.x=element_text(angle=45,hjust=1))
md_xd<-ggplot(md_data_xd, aes(x=reorder(md_data_xd$xd,-md_data_xd$X1800), y=md_data_xd$X1800))+geom_bar(stat="identity", width = 0.8, fill="steelblue", position = position_dodge(width = 1.9) )+
  geom_text(aes(label=md_data_xd$X1800), vjust=-1, color="black", size=3.5)+scale_x_discrete()+
  theme_minimal() + labs(x='Typ xd', y='liczba wiadomoœci', title = 'Suma xd  wed³ug typu') +theme(axis.text.x=element_text(angle=45,hjust=1))
tr_xd<-ggplot(tr_data_xd, aes(x=reorder(tr_data_xd$xD,-tr_data_xd$X7718), y=tr_data_xd$X7718))+geom_bar(stat="identity", width = 0.8, fill="steelblue", position = position_dodge(width = 1.9) )+
  geom_text(aes(label=tr_data_xd$X7718), vjust=-1, color="black", size=3.5)+scale_x_discrete()+
  theme_minimal() + labs(x='Typ xd', y='liczba wiadomoœci', title = 'Suma xd  wed³ug typu') +theme(axis.text.x=element_text(angle=45,hjust=1))
data_l<-read.csv("lengths.csv")
ccc<-ggplot(data_l, aes(y=data_l$X5, x=data_l$X10))+geom_bar(stat="identity",fill="steelblue")
ccc

svg("bp_xds.svg", height = 7.5, width = 8)
bp_xd
dev.off()
svg("md_xds.svg", height = 7.5, width = 8)
md_xd
dev.off()
svg("tr_xds.svg", height = 7.5, width = 8)
tr_xd
dev.off()


bp_length<-read.csv("lengths_bp.csv")
bp_length<-bp_length[which(bp_length$X13<=200),]
#bp_length<-bp_length[1:50000,]
#bp_len<-ggplot(bp_length, aes(y=bp_length$X4, x=bp_length$X13))+geom_bar(stat="identity",fill="steelblue")
bp_len<-ggplot(bp_length, aes(x=bp_length$X13))+geom_histogram(fill="steelblue",binwidth = 0.5)+
  theme_minimal()+ labs(x='d³ugoœæ wiadomoœci', y='liczba wiadomoœci', title = 'Histogram d³ugoœci wiadomoœci tekstowych')

md_length<-read.csv("md_lengths.csv")
#md_length<-md_length[1:5000,]
md_len<-ggplot(md_length, aes(x=md_length$X10))+geom_histogram(fill="steelblue",binwidth = 0.5)+
  theme_minimal()+ labs(x='d³ugoœæ wiadomoœci', y='liczba wiadomoœci', title = 'Histogram d³ugoœci wiadomoœci tekstowych')

tr_length<-read.csv("lengths_tr.csv")
tr_length<-tr_length[which(tr_length$X21<=200),]
#tr_length<-tr_length[1:5000,]
tr_len<-ggplot(tr_length, aes(x=tr_length$X21))+geom_histogram(fill="steelblue",binwidth = 0.5)+
  theme_minimal()+ labs(x='d³ugoœæ wiadomoœci', y='liczba wiadomoœci', title = 'Histogram d³ugoœci wiadomoœci tekstowych')

bp_len
svg("bp_length.svg", height = 7.5, width = 8)
bp_len
dev.off()
svg("md_length.svg", height = 7.5, width = 8)
md_len
dev.off()
 svg("tr_length.svg", height = 7.5, width = 8)
tr_len
dev.off()

