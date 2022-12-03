# Caravel User Project

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![UPRJ_CI](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/user_project_ci.yml) [![Caravel Build](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml/badge.svg)](https://github.com/efabless/caravel_project_example/actions/workflows/caravel_build.yml)

| :exclamation: GF180mcuC shuttle MPW0            |
|-----------------------------------------|

## Binary Counter

This is a binary counter with `clock`, `reset`, `data_in`, `scanload`, and `count_out`.

The counter design (gdsii file) is located at [here](https://github.com/AyaseErii/gf180-demo-sequential_counter/tree/main/openlane/cntr_example/runs/cntr_example/results/final/gds) and the wrappered counter (gdsii file) is located at [here](https://github.com/AyaseErii/gf180-demo-sequential_counter/tree/main/openlane/user_project_wrapper/runs/user_project_wrapper/results/final/gds).

### Step 1: Create the Digital Counter Design
Before running the design flow, please make sure the gf180 PDK was installed correctly. For the information about switching PDK from `sky130` to `gf180mcuC`, you may refer to [this video](https://www.youtube.com/watch?v=4-kISttsPbY). (Great thanks to Matt)

Once you have done with PDK setups, you can simply follow the commands below after you changed the corresponding [cntr_example.v](https://github.com/AyaseErii/gf180-demo-sequential_counter/blob/main/verilog/rtl/cntr_example.v), [config.tcl](https://github.com/AyaseErii/gf180-demo-sequential_counter/blob/main/openlane/cntr_example/config.tcl) file, all files in the [includes](https://github.com/AyaseErii/gf180-demo-sequential_counter/tree/main/verilog/includes) directory, and the [user_netlist.v](https://github.com/AyaseErii/gf180-demo-sequential_counter/blob/main/verilog/rtl/uprj_netlists.v) of the counter:
```
git clone https://github.com/AyaseErii/gf180-demo-binary_counter.git
cd gf180-demo-binary_counter
make cntr_example
```

The command above will generate the digital counter design (gdsii) and all necessary files for the next step---wrapper the design in to `user_project_wrapper`.

### Step 2: Create the Wrappered Digital Counter

Before running the flow of `user_project_wrapper`, please make sure you changed the [user_project_wrapper.v](https://github.com/AyaseErii/gf180-demo-sequential_counter/blob/main/verilog/rtl/user_project_wrapper.v), [config.tcl](https://github.com/AyaseErii/gf180-demo-sequential_counter/blob/main/openlane/user_project_wrapper/config.tcl) of the `user_project_wrapper.v`, and [macro.cfg](https://github.com/AyaseErii/gf180-demo-sequential_counter/blob/main/openlane/user_project_wrapper/macro.cfg) for macro placement.

Once you have done with the above commands, you need to go to `gf180-demo-binary_counter` directory again, and use the command below:
```
make user_project_wrapper
```

After the flow compeleted, you can repeat the Step 2 iteratively until you get a satisfied design.

## Contributors
Jun (Jerry) Yin, Ceylan M. Morgul, Rahul Sreekumar, Xuanjia (Eric) Bi, and Mircea R. Stan.

ECE department of University of Virginia


## Additional Information about Caravel

Refer to [README](docs/source/index.rst#section-quickstart) for a quickstart of how to use caravel_user_project

Refer to [README](docs/source/index.rst) for this sample project documentation. 
