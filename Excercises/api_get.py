import json
import requests

response = requests.get('https://jsonplaceholder.typicode.com/todos')
print(response.status_code)
results = response.json()

import pandas as pd
data = pd.DataFrame(results)
data.head(10)
