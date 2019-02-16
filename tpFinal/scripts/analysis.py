#!/usr/bin/python

import matplotlib.pyplot as plt

# Options
point_size          = 20
show_cpi            = 1
show_hr             = 1
show_local_hist     = 1
show_global_hist    = 1
show_two_level      = 1
show_loop           = 1
show_gcd            = 1
show_bubble         = 1
show_qsort          = 1
show_avg            = 1

# Read the data

local_hist_bits         = []
local_hist_loop_hr      = []
local_hist_gcd_hr       = []
local_hist_bubble_hr    = []
local_hist_qsort_hr     = []
local_hist_avg_hr       = []
local_hist_loop_cpi     = []
local_hist_gcd_cpi      = []
local_hist_bubble_cpi   = []
local_hist_qsort_cpi    = []
local_hist_avg_cpi      = []

global_hist_bits        = []
global_hist_loop_hr     = []
global_hist_gcd_hr      = []
global_hist_bubble_hr   = []
global_hist_qsort_hr    = []
global_hist_avg_hr      = []
global_hist_loop_cpi    = []
global_hist_gcd_cpi     = []
global_hist_bubble_cpi  = []
global_hist_qsort_cpi   = []
global_hist_avg_cpi     = []

two_level_bits          = []
two_level_loop_hr       = []
two_level_gcd_hr        = []
two_level_bubble_hr     = []
two_level_qsort_hr      = []
two_level_avg_hr        = []
two_level_loop_cpi      = []
two_level_gcd_cpi       = []
two_level_bubble_cpi    = []
two_level_qsort_cpi     = []
two_level_avg_cpi       = []

# First local history
with open("../data/local_history.txt", "r") as f:
    next(f); # ignore header
    next(f); # ignore header
    for line in f:
        splitLine = line.split();
        local_hist_bits.append(float(splitLine[0]));
        local_hist_loop_hr.append(float(splitLine[1]));
        local_hist_loop_cpi.append(float(splitLine[2]));
        local_hist_gcd_hr.append(float(splitLine[3]));
        local_hist_gcd_cpi.append(float(splitLine[4]));
        local_hist_bubble_hr.append(float(splitLine[5]));
        local_hist_bubble_cpi.append(float(splitLine[6]));
        local_hist_qsort_hr.append(float(splitLine[7]));
        local_hist_qsort_cpi.append(float(splitLine[8]));
        local_hist_avg_hr.append(float(splitLine[9]));
        local_hist_avg_cpi.append(float(splitLine[10]));

# Then global history
with open("../data/global_history.txt", "r") as f:
    next(f); # ignore header
    next(f); # ignore header
    for line in f:
        splitLine = line.split();
        global_hist_bits.append(float(splitLine[0]));
        global_hist_loop_hr.append(float(splitLine[1]));
        global_hist_loop_cpi.append(float(splitLine[2]));
        global_hist_gcd_hr.append(float(splitLine[3]));
        global_hist_gcd_cpi.append(float(splitLine[4]));
        global_hist_bubble_hr.append(float(splitLine[5]));
        global_hist_bubble_cpi.append(float(splitLine[6]));
        global_hist_qsort_hr.append(float(splitLine[7]));
        global_hist_qsort_cpi.append(float(splitLine[8]));
        global_hist_avg_hr.append(float(splitLine[9]));
        global_hist_avg_cpi.append(float(splitLine[10]));

# Finaly two level
with open("../data/two_level.txt", "r") as f:
    next(f); # ignore header
    next(f); # ignore header
    for line in f:
        splitLine = line.split();
        two_level_bits.append(float(splitLine[0]));
        two_level_loop_hr.append(float(splitLine[1]));
        two_level_loop_cpi.append(float(splitLine[2]));
        two_level_gcd_hr.append(float(splitLine[3]));
        two_level_gcd_cpi.append(float(splitLine[4]));
        two_level_bubble_hr.append(float(splitLine[5]));
        two_level_bubble_cpi.append(float(splitLine[6]));
        two_level_qsort_hr.append(float(splitLine[7]));
        two_level_qsort_cpi.append(float(splitLine[8]));
        two_level_avg_hr.append(float(splitLine[9]));
        two_level_avg_cpi.append(float(splitLine[10]));

# local history HR
if show_local_hist and show_hr:
    plt.figure()

    plt.title('Historía Local')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(local_hist_bits, local_hist_loop_hr, s=point_size, label='Loop');
    plt.scatter(local_hist_bits, local_hist_gcd_hr, s=point_size, label='GCD');
    plt.scatter(local_hist_bits, local_hist_bubble_hr, s=point_size, label='Bubble sort');
    plt.scatter(local_hist_bits, local_hist_qsort_hr, s=point_size, label='Quick sort');

    plt.legend()

# local history CPI
if show_local_hist and show_cpi:
    plt.figure()

    plt.title('Historía Local')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(local_hist_bits, local_hist_loop_cpi, s=point_size, label='Loop');
    plt.scatter(local_hist_bits, local_hist_gcd_cpi, s=point_size, label='GCD');
    plt.scatter(local_hist_bits, local_hist_bubble_cpi, s=point_size, label='Bubble sort');
    plt.scatter(local_hist_bits, local_hist_qsort_cpi, s=point_size, label='Quick sort');

    plt.legend()

# global history HR
if show_global_hist and show_hr:
    plt.figure()

    plt.title('Historía Global')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(global_hist_bits, global_hist_loop_hr, s=point_size, label='Loop');
    plt.scatter(global_hist_bits, global_hist_gcd_hr, s=point_size, label='GCD');
    plt.scatter(global_hist_bits, global_hist_bubble_hr, s=point_size, label='Bubble sort');
    plt.scatter(global_hist_bits, global_hist_qsort_hr, s=point_size, label='Quick sort');

    plt.legend()

# global history CPI
if show_global_hist and show_cpi:
    plt.figure()

    plt.title('Historía Global')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(global_hist_bits, global_hist_loop_cpi, s=point_size, label='Loop');
    plt.scatter(global_hist_bits, global_hist_gcd_cpi, s=point_size, label='GCD');
    plt.scatter(global_hist_bits, global_hist_bubble_cpi, s=point_size, label='Bubble sort');
    plt.scatter(global_hist_bits, global_hist_qsort_cpi, s=point_size, label='Quick sort');

    plt.legend()

# two level HR
if show_two_level and show_hr:
    plt.figure()

    plt.title('Dos Niveles')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(two_level_bits, two_level_loop_hr, s=point_size, label='Loop');
    plt.scatter(two_level_bits, two_level_gcd_hr, s=point_size, label='GCD');
    plt.scatter(two_level_bits, two_level_bubble_hr, s=point_size, label='Bubble sort');
    plt.scatter(two_level_bits, two_level_qsort_hr, s=point_size, label='Quick sort');

    plt.legend()

# two level CPI
if show_two_level and show_cpi:
    plt.figure()

    plt.title('Dos Niveles')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(two_level_bits, two_level_loop_cpi, s=point_size, label='Loop');
    plt.scatter(two_level_bits, two_level_gcd_cpi, s=point_size, label='GCD');
    plt.scatter(two_level_bits, two_level_bubble_cpi, s=point_size, label='Bubble sort');
    plt.scatter(two_level_bits, two_level_qsort_cpi, s=point_size, label='Quick sort');

    plt.legend()

# loop HR
if show_loop and show_hr:
    plt.figure()

    plt.title('Loop')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(local_hist_bits, local_hist_loop_hr, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_loop_hr, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_loop_hr, s=point_size, label='Dos Niveles');

    plt.legend()

# loop CPI
if show_loop and show_cpi:
    plt.figure()

    plt.title('Loop')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(local_hist_bits, local_hist_loop_cpi, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_loop_cpi, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_loop_cpi, s=point_size, label='Dos Niveles');

    plt.legend()

# GCD HR
if show_gcd and show_hr:
    plt.figure()

    plt.title('GCD')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(local_hist_bits, local_hist_gcd_hr, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_gcd_hr, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_gcd_hr, s=point_size, label='Dos Niveles');

    plt.legend()

# GCD CPI
if show_gcd and show_cpi:
    plt.figure()

    plt.title('GCD')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(local_hist_bits, local_hist_gcd_cpi, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_gcd_cpi, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_gcd_cpi, s=point_size, label='Dos Niveles');

    plt.legend()

# bubble HR
if show_bubble and show_hr:
    plt.figure()

    plt.title('Bubble Sort')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(local_hist_bits, local_hist_bubble_hr, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_bubble_hr, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_bubble_hr, s=point_size, label='Dos Niveles');

    plt.legend()

# bubble CPI
if show_bubble and show_cpi:
    plt.figure()

    plt.title('Bubble Sort')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(local_hist_bits, local_hist_bubble_cpi, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_bubble_cpi, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_bubble_cpi, s=point_size, label='Dos Niveles');

    plt.legend()

# qsort HR
if show_qsort and show_hr:
    plt.figure()

    plt.title('Quick Sort')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(local_hist_bits, local_hist_qsort_hr, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_qsort_hr, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_qsort_hr, s=point_size, label='Dos Niveles');

    plt.legend()

# qsort CPI
if show_qsort and show_cpi:
    plt.figure()

    plt.title('Quick Sort')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(local_hist_bits, local_hist_qsort_cpi, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_qsort_cpi, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_qsort_cpi, s=point_size, label='Dos Niveles');

    plt.legend()

# Averages of the three predictors HR
if show_avg and show_hr:
    plt.figure()

    plt.title('Promedios')
    plt.xlabel('Bits')
    plt.ylabel('HR%')

    plt.scatter(local_hist_bits, local_hist_avg_hr, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_avg_hr, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_avg_hr, s=point_size, label='Dos Niveles');

    plt.legend()

# Averages of the three predictors CPI
if show_avg and show_cpi:
    plt.figure()

    plt.title('Promedios')
    plt.xlabel('Bits')
    plt.ylabel('CPI')

    plt.scatter(local_hist_bits, local_hist_avg_cpi, s=point_size, label='Local');
    plt.scatter(global_hist_bits, global_hist_avg_cpi, s=point_size, label='Global');
    plt.scatter(two_level_bits, two_level_avg_cpi, s=point_size, label='Dos Niveles');

    plt.legend()

plt.show()

