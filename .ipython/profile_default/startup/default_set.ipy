import pandas as pd
import re
import sys
import os
import json
import matplotlib.pyplot as plt
import japanize_matplotlib
import seaborn as sns
from collections import Counter, defaultdict
import pickle
sns.set(style='darkgrid')

pd.options.display.max_colwidth = 200

import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)
warnings.simplefilter(action='ignore', category=UserWarning)


def op(x):
    '''ファイルをよしなに開く関数'''
    if not os.path.exists(x):
        print(f'Not found: {x}')
    ext = os.path.splitext(x)[1]
    if ext == '.pkl' or ext == '.pickle':
        with open(x, 'rb') as f:
            res = pickle.load(f)
    elif ext == '.feather':
        res = pd.read_feather(x)
    elif ext == '.csv' or ext == '.txt':
        res = pd.read_csv(x)
    elif ext == '.tsv':
        res = pd.read_csv(x, sep='\t')
    elif ext == '.json':
        with open(x, 'r') as f:
            res = json.load(f)
    else:
        print(f'Not support: {ext}')
    return res
