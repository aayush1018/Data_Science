#installation and loading of relevant packages
install.packages('caret')
library(caret)

#reading the data
student_score=read.csv("student_scores.csv")
str(student_score)
summary(student_score)

## Dividing the sample data into 2 parts for training and testing model
x=floor(0.8*nrow(student_score))
set.seed(123)
train_model=sample(seq_len(nrow(student_score)), size=x)
train=student_score[train_model,] #This model will have 20 rows of data
test=student_score[-train_model,] #This model will have 5 rows of data

#set.seed() will ensure that model parameters remain constant for any machine
set.seed(123)
model=lm(Scores~Hours,data=train)
# model statistics
summary(model)

# Plot of Scores vs Hours in training dataset
plot(train$Hours,train$Scores,xlab="Hours",,ylab="Scores",main="Liner Regression Model")
abline(lm(train$Scores~train$Hours),col="red")

#Predicting Score using formula if the student studies for 9.25 hours
input = 9.25 # change to predict for different study hours
predicted_score=1.3145+10.1670* input
predicted_score

#predicting models accuracy with test model
predict_test=predict(model,newdata=test)
predict_test
# appending predicted scores with actual scores
predict_test = cbind(test, predict_test)
predict_test

#testing model accuracy on test data
R2(predict_test$predict_test, predict_test$Scores)

#Since the predicted R^2 value for test data is close to the adjusted value of 
#R^2 on training data, we can say that the model accuracy is actually good. 

#Note: The above entire exercise was to illustrate my understanding of the topic only. 
#Model accuracy and interpretation of model results would have been very different
#with richer quality of data. 


