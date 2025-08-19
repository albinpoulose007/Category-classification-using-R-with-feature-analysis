install.packages("caret")
install.packages("glmnet")

options(digits = 20)

# find the lowest value in frame and return
getMin = function(frame) {
  minimum = min(frame$difference)
  frame[which(frame$difference == minimum),]
}

# find if value exists in dataset, if it is return otherwise find the nearest value in dataset
getNearest = function(input, output) {
  outputFrame = input[which(input[,c(2)] == output), ]
  if (nrow(outputFrame) > 0){
    names(outputFrame) = c('V1', 'isExactMatch')
  }else {
    difference = abs(input[,c(2)]-output)
    outputFrame = data.frame(input[,c(1)], difference)
    names(outputFrame) = c('V1', 'difference')
    outputFrame = getMin(outputFrame)
  }
  outputFrame
}

# ---------------------------------------------------------
b_dataset = read.table(file = "dataset_b6.csv", header = FALSE, strip.white = TRUE, stringsAsFactors = TRUE, sep = ","); str(b_dataset)

B_Classifier = function(value) {
  #analyze values_vector and create your criteria
  getNearest(b_dataset, value)[1]
}

print(B_Classifier(0.1731428710029030))

# ---------------------------------------------------------

c_dataset = read.table(file = "c0.csv", header = FALSE, strip.white = TRUE, stringsAsFactors = TRUE, sep = ","); str(c_dataset)

C_Classifier = function(file_name, values_vector) {
  # Read the selected file
  c_dataset = read.table(file = file_name, header = FALSE, strip.white = TRUE,
                         stringsAsFactors = TRUE, sep = ",")
  #analyze values_vector and create your criteria
  output = c()
  counter = 1
  for (value in values_vector) {
    output[counter] = getNearest(c_dataset, value)[c(1)]
    counter = counter + 1
  }
  output
}
# Allow the user to select a file interactively
selected_file <- file.choose()
# Call C_Classifier with the selected file and values
result <- C_Classifier(selected_file, c(239.56798589879700, 3.22170221106961200,
                                        212.76518053622200))
print(result)

# ---------------------------------------------------------

library("caret")
library("glmnet")

options(digits = 20)
o_dataset = read.table(file = "dataset_o6.csv", header = TRUE, strip.white = TRUE, stringsAsFactors = TRUE, sep = ","); str(o_dataset)
colnames(o_dataset) = c('V1', 'V2', 'V3', 'V4', 'V5', 'V6', 'V7', 'V8', 'V9')
trControl = trainControl(method = "repeatedcv",
                         10,
                         5,
                         verboseIter = T)
set.seed(1212121212)
modal = train(V1 ~ V2+V3+V4+V5+V6+V7+V8+V9,
              o_dataset,
              method = 'glmnet',
              tuneGrid = expand.grid(alpha = 0, lambda = seq(0.0001, 1, length = 5)),
              trControl = trControl)

test_data_vector = c(
  0.96649628,2.013170766,0.383186652,0.102118084,1.013104189,0.112836605,1.098008553,0.043559417)

test_data = rbind(test_data_vector)
colnames(test_data) = colnames(o_dataset[-1])

v<-predict(modal, test_data); v