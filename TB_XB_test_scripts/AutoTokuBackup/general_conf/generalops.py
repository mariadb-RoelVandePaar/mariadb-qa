#!/opt/Python3/bin/python3

import configparser
from os.path import isfile
import sys

class GeneralClass:

    def __init__(self, config='/etc/tokubackup.conf'):

        if isfile(config):
            con = configparser.ConfigParser()
            con.read(config)
            catalog = con.sections()

            DB = catalog[0]
            self.mysql = con[DB]['mysql']
            self.user = con[DB]['user']
            self.password = con[DB]['password']
            self.port = con[DB]['port']
            self.socket = con[DB]['socket']
            self.host = con[DB]['host']
            self.datadir = con[DB]['datadir']

            ######################################################

            BCK = catalog[1]
            self.backupdir = con[BCK]['backupdir']

        else:
            print("Missing config file : /etc/tokubackup.conf")
            sys.exit(-1)

