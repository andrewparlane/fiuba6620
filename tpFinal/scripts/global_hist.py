#!/usr/bin/python

import sys
import json

def usage():
    print("Usage:")
    print("  python", sys.argv[0], "N M")
    print("  Where there are 2^N counters each M bits wide");

if len(sys.argv) != 3:
    usage();
    exit();

if not (sys.argv[1].isdigit() and sys.argv[2].isdigit()):
    usage();
    exit();

n = int(sys.argv[1]);
m = int(sys.argv[2]);

print("Using n =", n, "and m =", m);

with open("../cpu/pipeline-extended-global-history.cpu", "r") as read_file:
    data = json.load(read_file)

    # Set width of the counters to m bits
    data["components"]["satCounters"]["width"] = m;

    # Set the number of counters to 2**n
    data["components"]["satCounters"]["num_counters"] = 2**n;

    # Set initial value to 2^(m-1) - 1
    data["components"]["satCounters"]["initial_value"] = 2**(m-1) - 1;

    # Set the predicted value distributer input width
    data["components"]["DistPredVal"]["in"]["size"] = m;

    # Set the predicted value distributer output msb and lsb to be the msb of the counter
    data["components"]["DistPredVal"]["out"][0]["msb"] = m-1;
    data["components"]["DistPredVal"]["out"][0]["lsb"] = m-1;

    # Set the ForkReadIdx size
    data["components"]["ForkGHRD"]["size"] = n;

    # Set the GlobalHist shift register width
    data["components"]["GlobalHist"]["width"] = n;

    # Set the width of PredictorIdx in the ID/EX and EX/MEM pipeline registers
    data["components"]["ID/EX"]["regs"]["GlobalHistIdx"] = n;
    data["components"]["EX/MEM"]["regs"]["GlobalHistIdx"] = n;

    # Change the connection port from the predicted value distributer
    wire = next(w for w in data["wires"] if w["from"] == "DistPredVal");
    wire["out"] = str(m-1) + "-" + str(m-1);

    # Finally write it back
    with open("../cpu/pipeline-extended-global-history.cpu", "w") as write_file:
        json.dump(data, write_file)