import pandas as pd
from sklearn.model_selection import train_test_split 
from sklearn.ensemble import RandomForestClassifier
import matplotlib.pyplot as plt
from sklearn.tree import DecisionTreeClassifier 
from sklearn import tree
import numpy as np
from sklearn.preprocessing import LabelEncoder

#1.	Please download the file Task4_data.xlsx from the folder.
data = pd.read_excel(r'/Users/tinym/Documents/IronHack/data/Task4_data.xlsx', sheet_name='data')

#2.	Calculate the number of missing values.
mv=data.isna().sum()

#3.	Provide the descriptive statistics for the dataset
stat=data.describe()
stat
#4.	Correlation matrix
cor=data.corr()
cor
#5.	Encode categorical data
encoder = LabelEncoder()
data['Education_encode']=encoder.fit_transform(data['Education'])
data['Marital_Status_encode']=encoder.fit_transform(data['Marital_Status'])
data=data.drop(columns=['Education', 'Marital_Status'])
data

#6.	Impute the missing values by 0
data=data.replace(np.nan,0)

#7.	Divide the dataset into independent and dependent variables
#split dataset in features and target variable
data.columns
feature_cols = ['Year_Birth', 'Income', 'Kidhome', 'Recency', 'MntFruits', 
       'MntMeatProducts', 'MntFishProducts',  'Education_encode',
       'Marital_Status_encode']

features=data[feature_cols]
target=data["Response"]

#8.	Divide the datasets into train and test
# Split dataset into training set and test set
# Import train_test_split function
x_train, x_test, y_train, y_test = train_test_split(features, target, test_size=0.3, random_state=1) # 70% training and 30% test



#9.	Implement the Decision Tree/Random Forest Model with different parameters (up to 5 variants)
#import the method from the library
clf0 = DecisionTreeClassifier(max_depth=6)
model = clf0.fit(x_train, y_train)
text_representation = tree.export_text(clf0)
fig = plt.figure(figsize=(25,20))
_ = tree.plot_tree(clf0, 
                   feature_names=feature_cols,  
    
                   filled=True)
fig.savefig("decistion_tree.png")
y0_pred = clf0.predict(x_test)
score0_train = clf0.score(x_train, y_train)
score0 = clf0.score(x_test, y_test)
print(score0_train)
print(score0)

clf1=RandomForestClassifier()
clf2 = RandomForestClassifier(max_depth=2, random_state=0)
clf1.fit(x_train, y_train)
clf2.fit(x_train, y_train)

y1_pred=clf1.predict(x_test)
y2_pred=clf2.predict(x_test)




