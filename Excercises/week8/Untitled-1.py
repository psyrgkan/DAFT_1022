# %%
# Import required libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import sklearn
# Import necessary modules
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from math import sqrt

# %%
# Keras specific
from keras.models import Sequential
from keras.layers import Dense

# %%
df = pd.read_csv(r'../../../data/diabetes.csv')

# %%



