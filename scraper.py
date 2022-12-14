import requests
from bs4 import BeautifulSoup
import csv

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
                row_vals[i] = str(val.string).rstrip()
            writer.writerow(row_vals) # writes row values to file

for yr in range(1974,2023):
    try:
        url = f'https://www.wser.org/results/{yr}-results/'
        outfile = f'data/raw/wser_{yr}.csv'
        get_results(url, outfile)
    except:
        print(f'No results found for {yr}.')

get_results('https://www.wser.org/results/', 'data/raw/wser_summary.csv')
get_results('https://www.wser.org/weather/', 'data/raw/wser_weather.csv')