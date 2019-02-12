#!/usr/bin/python

import sys
import json

def usage():
    print("Usage:")
    print("  python", sys.argv[0], "N M")
    print("  Where there are 2^N counters in each bank, each M bits wide");

if len(sys.argv) != 3:
    usage();
    exit();

if not (sys.argv[1].isdigit() and sys.argv[2].isdigit()):
    usage();
    exit();

n = int(sys.argv[1]);
m = int(sys.argv[2]);

print("Using n =", n, "and m =", m);

with open("../cpu/pipeline-extended-two-level-predictor.cpu", "r") as read_file:
    data = json.load(read_file)

    # Set width of the counters to m bits
    data["components"]["LocalHist1"]["width"] = m;
    data["components"]["LocalHist2"]["width"] = m;
    data["components"]["LocalHist3"]["width"] = m;
    data["components"]["LocalHist4"]["width"] = m;

    # Set the number of counters to 2**n
    data["components"]["LocalHist1"]["num_counters"] = 2**n;
    data["components"]["LocalHist2"]["num_counters"] = 2**n;
    data["components"]["LocalHist3"]["num_counters"] = 2**n;
    data["components"]["LocalHist4"]["num_counters"] = 2**n;

    # Set initial value to 2^(m-1) - 1
    data["components"]["LocalHist1"]["initial_value"] = 2**(m-1) - 1;
    data["components"]["LocalHist2"]["initial_value"] = 2**(m-1) - 1;
    data["components"]["LocalHist3"]["initial_value"] = 2**(m-1) - 1;
    data["components"]["LocalHist4"]["initial_value"] = 2**(m-1) - 1;

    # Set the predicted value distributer input width
    data["components"]["DistPredVal1"]["in"]["size"] = m;
    data["components"]["DistPredVal2"]["in"]["size"] = m;
    data["components"]["DistPredVal3"]["in"]["size"] = m;
    data["components"]["DistPredVal4"]["in"]["size"] = m;

    # Set the predicted value distributer output msb and lsb to be the msb of the counter
    data["components"]["DistPredVal1"]["out"][0]["msb"] = m-1;
    data["components"]["DistPredVal1"]["out"][0]["lsb"] = m-1;
    data["components"]["DistPredVal2"]["out"][0]["msb"] = m-1;
    data["components"]["DistPredVal2"]["out"][0]["lsb"] = m-1;
    data["components"]["DistPredVal3"]["out"][0]["msb"] = m-1;
    data["components"]["DistPredVal3"]["out"][0]["lsb"] = m-1;
    data["components"]["DistPredVal4"]["out"][0]["msb"] = m-1;
    data["components"]["DistPredVal4"]["out"][0]["lsb"] = m-1;

    # Set the ForkReadIdx size
    data["components"]["ForkReadIdx1"]["size"] = n;
    data["components"]["ForkReadIdx2"]["size"] = n;
    data["components"]["ForkReadIdx3"]["size"] = n;
    data["components"]["ForkReadIdx4"]["size"] = n;

    # Set the ForkWriteIdx size
    data["components"]["ForkWriteIdx1"]["size"] = n;
    data["components"]["ForkWriteIdx2"]["size"] = n;
    data["components"]["ForkWriteIdx3"]["size"] = n;

    # Set the DistPC Output msb
    output = next(o for o in data["components"]["DistPC"]["out"] if o["lsb"] != 0);
    output["msb"] = 1+n;

    # Set the width of PredictorIdx in the ID/EX and EX/MEM pipeline registers
    data["components"]["ID/EX"]["regs"]["PredictorIdx"] = n;
    data["components"]["EX/MEM"]["regs"]["PredictorIdx"] = n;

    # Change the connection port from the predicted value distributer
    wire = next(w for w in data["wires"] if w["from"] == "DistPredVal1");
    wire["out"] = str(m-1) + "-" + str(m-1);
    wire = next(w for w in data["wires"] if w["from"] == "DistPredVal2");
    wire["out"] = str(m-1) + "-" + str(m-1);
    wire = next(w for w in data["wires"] if w["from"] == "DistPredVal3");
    wire["out"] = str(m-1) + "-" + str(m-1);
    wire = next(w for w in data["wires"] if w["from"] == "DistPredVal4");
    wire["out"] = str(m-1) + "-" + str(m-1);

    # Change the connection port from the PC distributer
    wire = next(w for w in data["wires"] if w["from"] == "DistPC" and w["out"] != "31-0");
    wire["out"] = str(n+1) + "-2";

    # Finally write it back
    with open("../cpu/pipeline-extended-two-level-predictor.cpu", "w") as write_file:
        json.dump(data, write_file)