## load all data
trainX <- read.table('train/X_train.txt');
trainY <- read.table('train/y_train.txt');
trainSubject <- read.table('train/subject_train.txt');

testX <- read.table('test/X_test.txt');
testY <- read.table('test/y_test.txt');
testSubject <- read.table('test/subject_test.txt');

activityLabel <- read.table('activity_labels.txt');

## merge data
X <- rbind(trainX,testX);
Y <- rbind(trainY,testY);
subject <- rbind(trainSubject,testSubject);

##set labels data
names(X) <- features[,2];

##extract mean and std "-std\(|-mean\(";
pattern <- "-std\\(\\)|-mean\\(\\)";
L <- grepl(pattern,features$V2);
index <- as.vector(t(features[L,][,1]));
newX <- X[,index];

##add subject and activity
newX$subject <- subject$V1;
newX$activity <- activityLabel[Y$V1,2];

##write first 4 tasks
write.table(newX,file="commonDataSet.txt", row.names = FALSE);


##add subject and activity
X$subject <- subject$V1;
X$activity <- activityLabel[Y$V1,2];

##group by activity and subject
res <- aggregate(X[1:(ncol(X)-2)], by=list(X$activity,X$subject), FUN=mean);

##rename first 2 column
names(res)<-c("activity","subject",names(res)[3:length(res)]);

##write 5 task
write.table(res,file="groupActivitySubject.txt", row.names = FALSE);