#!flask/bin/python
from audioop import avg
from flask import Flask, jsonify, abort, make_response, request
import requests
from itertools import islice

app = Flask(__name__)

# hide this in future iterations
API_KEY = "VN0JXW99GG42HKD7"

@app.route('/api/v1.0/get_ndays/<string:symbol>/<int:ndays>', methods=['GET'])
def get_closing_price(symbol, ndays):

    # bad request
    if (ndays < 1):
        abort(400)    

    url = "https://www.alphavantage.co/query?apikey={}&function=TIME_SERIES_DAILY_ADJUSTED&symbol={}".format(API_KEY, symbol)
    r = requests.get(url)
    data = r.json()

    avg_closing_price = 0
    print (data)
    ndata = islice(data["Time Series (Daily)"].items(), ndays)
    

    ndict = {}
    for key, val in ndata:
        avg_closing_price += float(val['4. close'])
        ndict[key] = val
    avg_closing_price /= ndays
    ndict['average_closing_price'] = avg_closing_price

    return ndict


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=8000)
