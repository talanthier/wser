import requests
from bs4 import BeautifulSoup
import csv


def get_results(url, year, outfile):
    req = requests.get(url)
    content = req.content
    soup = BeautifulSoup(content, 'html.parser')
    
    list_rows = soup.find_all('tr') # finds all table rows
    header = ['Year']
    for col in list_rows[0].find_all('th'):
        header.append(col.string) # appends column names
    num_cols = len(header)
    with open(outfile, 'w', encoding = 'utf8') as f:
        writer = csv.writer(f)
        writer.writerow(header) # writes header to file
        for row in list_rows[1:]:
            list_vals = row.find_all('td')
            row_vals = [year]*num_cols
            for i,val in enumerate(list_vals):
                row_vals[i+1] = val.string 
            writer.writerow(row_vals) # writes row values to file

get_results('https://www.wser.org/results/2022-results/', 2022, 'data/test.csv')