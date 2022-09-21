import pandas as pd
'''
results = pd.DataFrame()

list_states = ['AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL',
               'IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE',
               'NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD',
               'TN','TX','UT','VT','VA','WA','WV','WI','WY']

for yr in range(1974,2023):
    try:
        temp_df = pd.read_csv(f'data/raw/wser_{yr}.csv') 
        temp_df = temp_df.rename(columns = {'State/Country':'State'})
        if yr == 1990:
        	temp_df = temp_df.iloc[:,:-1] # remove last col from 1990 (column indicated reversed DQ decision)
        	print(temp_df.columns)
        temp_df['Year'] = yr
        results = pd.concat([results, temp_df], axis = 0, ignore_index = True) # load raw data into a single dataframe
    except:
        print(f'No results for {yr}.')

results['Country'] = results['State'] # adds column for country
for i in range(results.shape[0]):
    if results['State'].iloc[i] in list_states: # checks if a US state
        results['Country'].iloc[i] = 'USA' # adds country of USA
    else:
        results['State'].iloc[i] = None # removes state value if not in US

results.to_csv('data/results.csv', index = False)
'''

weather = pd.read_csv('data/raw/wser_weather.csv')

month_map = {'june':6, 'June':6, 'Jun':6, 'Jul':7, 'Aug':8}
weather[['day','month','year']] = weather['Date'].str.split('-', expand = True)
weather['month'] = weather['month'].replace(month_map)

print(weather[['year','month','day']])


weather['Date'] = pd.to_datetime(weather[['year','month','day']])

#summary = pd.read_csv('data/raw/wser_summary.csv')