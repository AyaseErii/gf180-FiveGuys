`default_nettype none
// update this to the name of your module
module wrapped_multiplier(
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif
    // interface as user_proj_example.v
    input wire wb_clk_i,
    input wire wb_rst_i,

    // Logic Analyzer Signals
    // only provide first 32 bits to reduce wiring congestion

    input  wire [`MPRJ_IO_PADS-1:0] io_in,
    output wire [`MPRJ_IO_PADS-1:0] io_out,
    output wire [`MPRJ_IO_PADS-1:0] io_oeb,

);

    // permanently set oeb so that outputs are always enabled: 0 is output, 1 is high-impedance
    assign io_oeb = {`MPRJ_IO_PADS{1'b0}};

    wire reset = ! wb_rst_i;

   // module mul16x16_signed(input CLK,input signed[15:0]A,B,output reg signed [31:0] P);

    mul16x16_signed mul16x16_signed_1(
        .CLK(wb_clk_i),
        .A(io_in),
        .B(wb_rst_i),
        .P(io_out)
        );

endmodule 
`default_nettype wire
