#!/usr/bin/env python2
# -*- coding: utf-8 -*-
"""
Created on Sun Jun  3 21:20:50 2018

@author: bhupinder
"""

import plotly as py
import plotly.graph_objs as go
import pandas as pd

df = pd.read_csv('pareto_obj.csv')
plotdata = []
fontsize = 20
labelsize = 25

for column in df.columns:
    mini = min(df[column])
    maxi = max(df[column])
    plotcolumn = dict(range = [mini,maxi],
                      label = column, 
                      values = df[column])
    plotdata.append(plotcolumn)


data = [
    go.Parcoords(
        line = dict(color = df[df.columns[0]],
                    colorscale = 'Jet',
                    cmin = min(df[df.columns[0]]),
                    cmax = max(df[df.columns[0]])),
        dimensions = plotdata,
        labelfont = dict(size = labelsize),
        tickfont = dict(size = fontsize),
        rangefont = dict(size = fontsize)
    )
]

py.offline.plot(data, filename = 'pareto.html', image ='jpeg')