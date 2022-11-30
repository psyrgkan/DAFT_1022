import pandas as pd
import numpy as np
import re

df = pd.read_csv(r'../../../data/data.csv')

# Getting the acronym of each account
delimiters = " ", "/", "-"
regex_pattern = '|'.join(map(re.escape, delimiters))
regex_pattern

df['Acronym'] = df.Account.apply(lambda x: re.split(regex_pattern, x)[0])

# Using the acronym to group them together
acc_list = df.groupby(by='Acronym')['Account'].agg(lambda x: x.value_counts(ascending=False).index[0] 
                                                    if x.value_counts(ascending=False)[0] > 1 
                                                    else x.value_counts(ascending=False).index[:])

# Iterating through the grouped list, if things appear once, then we have a majority number, therefore, 
# we use the id of that account, otherwise, we iterate through the ids of the accounts with the same acronym
# to find lowest id

for acc in acc_list:
    if type(acc) is str:
        acronym = df.loc[(df.Account == acc)].Acronym.values[0]
        id = df.loc[(df.Account == acc)].AccountID.values[0]
        df.loc[(df.Acronym == acronym), 'MasterID'] = id
    else:
        acronym = df.loc[(df.Account == acc[0])].Acronym.values[0]
        id = df.loc[(df.Acronym == acronym)].AccountID.sort_values(ascending=True).reset_index(drop=True)[0]
        df.loc[(df.Acronym == acronym), 'MasterID'] = id

df.MasterID = df.MasterID.astype(np.int64)


