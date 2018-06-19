#!/usr/bin/env python

#csv parser
import csv
import os

DATADIR =""
DATAFILE = "745090.csv"

#parser function
def parse_file(datafile):
    name = ""
    data = []
    with open(datafile,'rb') as f:
        r = csv.reader(f)
        for row in r:
            data.append(row)
        name = data[0][1]
        data = data[2:]

    return (name,data)

def test():
    datafile = os.path.join(DATADIR, DATAFILE)
    name, data = parse_file(datafile)
    print name
    print data[0][1]
    print data[0]

    assert name == "MOUNTAIN VIEW MOFFETT FLD NAS"
    assert data[0][1] == "01:00"
    assert data[2][0] == "01/01/2005"
    assert data[2][5] == "2"

if __name__ == "__main__":
    test()
