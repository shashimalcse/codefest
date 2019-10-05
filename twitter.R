#==========Load the data

train<-read.csv("sample_twitter_personal_data.tsv", sep = "\t",header = TRUE,)
class(train)

#==========(Q1.)==All the headers in dataset

colnames_list<-names(train)

#==========(Q2.)==Order (ascending) the headers and assign numbers for the ordered headers

sorted_colnames<-sort(colnames_list)
Names<-NULL
for(i in 1:14){
  Names[i]<-paste(i,sorted_colnames[i],sep=" ")
}
Names

#================(Q3.)== All Twitter users whose "followers_count" is greater (>) than 100.


flw_count_g100=train[which(train$followers_count>100),]


#================(Q4.)==All the twitter MALE users whose "followers_count" is greater (>) than 100.

flw_count_g100_male<-flw_count_g100[which(flw_count_g100$gender=="male"),]

#================(Q5.) plot the graphs of count of initiate to follow based on gender

ggplot(train,aes(x=initiated_to_follow,fill=gender))+
  geom_histogram(binwidth = 200)+
  facet_wrap(~gender)+
  ggtitle("initiated_to_follow")+
  xlab("initiated_to_follow")+
  ylab("Total Count")+
  labs(fill="gender")

#================(Q6. 1)== HISTOGRAMS for day column in DOB

ggplot(train,aes(x=dob_day))+
  geom_histogram(binwidth = 1,color="darkblue", fill="lightblue")+
  ggtitle("DoB_Day")+
  xlab("dob_day")+
  ylab("Total Count")

#================(Q6. 2)==FREQUENCY PLOT for the followers count

ggplot(train,aes(x=followers_count))+
  geom_freqpoly(binwidth = 50,color="darkblue")+
  ggtitle("followers_count")+
  xlab("followers_count")+
  ylab("Total Count")

#================(Q6. 3)==FREQUENCY PLOT for the age of the users over the years in the sample dataset

ggplot(train,aes(x=dob_year))+
  geom_freqpoly(color="darkblue")+
  ggtitle("Age of the users over the years")+
  xlab("Year")+
  ylab("Count")

#============(Q6. 4)==BAR CHART to indicate and show the total hearts given by male, female users

ggplot(train,aes(x=gender,y=heart/10000))+
  geom_col(color="darkblue")+
  ggtitle("total hearts given by male, female users")+
  xlab("gender")+
  ylab("Total Count of Heart (10**4)")

#================(q6. 5)==Analyze and visualize in CHART to confirm that people use a mobile/web interface to experience twitter

train.mobileonly<-train[which((train$mobile_app_heart!=0 | train$mobile_app_heart_received!=0) & (train$web_heart==0 & train$web_heart_received==0)),]
train.webonly<-train[which((train$mobile_app_heart==0 & train$mobile_app_heart_received==0) & (train$web_heart!=0 | train$web_heart_received!=0)),]
train.mobileandweb<-train[which((train$mobile_app_heart!=0 | train$mobile_app_heart_received!=0) & (train$web_heart!=0 | train$web_heart_received!=0)),]
train.not<-train[which((train$mobile_app_heart==0 & train$mobile_app_heart_received==0) & (train$web_heart==0 & train$web_heart_received==0)),]
train.mobileonly$user<-"M"
train.webonly$user<-"W"
train.mobileandweb$user<-"MW"
train.not$user<-"N"

train.combined<-rbind(train.mobileandweb,train.webonly,train.mobileonly,train.not)
  
ggplot(train.combined,aes(x=user,fill=user))+
  geom_bar(width=0.5)+
  facet_wrap(~gender)+
  xlab("user type")+
  ylab("Total Count")+
  labs(fiil="Survived")