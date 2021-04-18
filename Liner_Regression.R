#reading the data
student_score=read.csv("student_scores.csv")
str(student_score)
summary(student_score)

## Dividing the sample data into 2 parts for training and testing model
x=floor(0.8*nrow(student_score))
x
set.seed(123)
train_model=sample(seq_len(nrow(student_score)), size=x)
train=student_score[train_model,]
test=student_score[-train_model,]

model=lm(Hours~Scores,data=train)
summary(model)
plot(train$Scores,train$Hours,xlab="Scores",,ylab="Hours",main="Liner Regression Model")

abline(lm(train$Hours~train$Scores),col="red")

predict_test=predict(model,newdata=test)
predict_test

#Predicted Score using formula if the student studies for 9.25 hours
predicted_score=-0.006286+0.097480*9.25
predicted_score



