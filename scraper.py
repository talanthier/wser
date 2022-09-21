import requests
from bs4 import BeautifulSoup
import csv
import pycountry

list_states = ['AL','AK','AZ','AR','CA','CO','CT','DE','DC','FL','GA','HI','ID','IL',
               'IN','IA','KS','KY','LA','ME','MD','MA','MI','MN','MS','MO','MT','NE',
               'NV','NH','NJ','NM','NY','NC','ND','OH','OK','OR','PA','RI','SC','SD',
               'TN','TX','UT','VT','VA','WA','WV','WI','WY']
col_names = {'First' : 'First Name', 'Last' : 'Last Name', 'State or Country':'State/Country'}


def get_results(url, outfile):
    '''Scrapes official Western States results and writes results to a csv file.'''
    req = requests.get(url)
    soup = BeautifulSoup(req.content, 'html.parser')
    list_rows = soup.find_all('tr') # finds all table rows
    header = []
    for col in list_rows[0].find_all('th'):
        header.append(col.string) # appends column names
    header = [col_names.get(x,x) for x in header]
    num_cols = len(header)
    with open(outfile, 'w', encoding = 'utf8', newline = '') as f:
        writer = csv.writer(f)
        writer.writerow(header) # writes header to file
        for row in list_rows[1:]:
            list_vals = row.find_all('td')
            row_vals = ['']*num_cols
            for i,val in enumerate(list_vals):
                row_vals[i] = val.string 
            writer.writerow(row_vals) # writes row values to file

for yr in range(1974,2023):
    try:
        url = f'https://www.wser.org/results/{yr}-results/'
        outfile = f'data/wser_{yr}.csv'
        get_results(url, outfile)
    except:
        print(f'No results found for {yr}.')

get_results('https://www.wser.org/results/', 'data/wser_summary.csv')
get_results('https://www.wser.org/weather/', 'data/wser_weather.csv')