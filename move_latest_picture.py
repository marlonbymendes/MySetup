import sys
import os
from datetime import datetime
from pathlib import Path


STARTS_WITH = 'Screen Shot '
EXTENSION = '.png'
DESKTOP = 'Desktop'
DIR = os.path.join(Path.home(), DESKTOP)

print(f'DIR = {DIR}')
print(f'Files = {os.listdir(DIR)}')

def pic_date(name):
    name = name[:-len(EXTENSION)]
    _, _, year_month_day, _, hour_minute_second, am_pm = name.split(' ')

    hour_tokens = hour_minute_second.split('.')
    hour = hour_tokens[0]
    if len(hour) < 2:
        hour = '0' + hour
        hour_tokens[0] = hour
        hour_minute_second = '.'.join(hour_tokens)

    datestr = ' '.join([year_month_day, hour_minute_second, am_pm])
    FORMAT = '%Y-%m-%d %I.%M.%S %p'
    date = datetime.strptime(datestr, FORMAT)
    return date


class Pic:
    def __init__(self, filename):
        self.filename = filename
        self.filepath = os.path.join(DIR, filename)
        self.date = pic_date(filename)

    def __str__(self):
        return f'pic date={self.date}'

    def __repr__(self):
        return self.__str__()

def get_latest_pic():
    files = os.listdir(DIR)
    files = list(filter(lambda s : s.startswith(STARTS_WITH) and s.endswith(EXTENSION), files))
    pics = [Pic(filename) for filename in files]
    latest_pic = max(pics, key=lambda p : p.date)
    return latest_pic

def move_to(frompath, topath):
    cmd = f'mv {frompath} {topath}'
    print(f'Trying cmd="{cmd}"')
    os.system(cmd)

if __name__ == '__main__':
    latest = get_latest_pic()
    to = sys.argv[1]
    frompath = latest.filepath.replace(' ', '\\ ')
    move_to(frompath, to)
    print(f'Moved {latest.filename} to {to}')
