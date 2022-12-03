// Copyright 2007 Altera Corporation. All rights reserved.  
// Altera products are protected under numerous U.S. and foreign patents, 
// maskwork rights, copyrights and other intellectual property laws.  
//
// This reference design file, and your use thereof, is subject to and governed
// by the terms and conditions of the applicable Altera Reference Design 
// License Agreement (either as signed by you or found at www.altera.com).  By
// using this reference design file, you indicate your acceptance of such terms
// and conditions between you and Altera Corporation.  In the event that you do
// not agree with such terms and conditions, you may not use the reference 
// design file and please promptly destroy any copies you have made.
//
// This reference design file is being provided on an "as-is" basis and as an 
// accommodation and therefore all warranties, representations or guarantees of 
// any kind (whether express, implied or statutory) including, without 
// limitation, warranties of merchantability, non-infringement, or fitness for
// a particular purpose, are specifically disclaimed.  By making this reference
// design file available, Altera expressly does not recommend, suggest or 
// require that this reference design file be used in combination with any 
// other product not provided by Altera.
/////////////////////////////////////////////////////////////////////////////

// baeckler - 06-16-2006
// Modified by Jun (Jerry) Yin - 12-01-2022
// Standard issue binary counter with all of the register secondary
// hardware. (1 cell per bit)


module cntr_example #(
    parameter BITS = 32
)(
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wire wb_clk_i,
    input wire wb_rst_i,
    input wire wbs_stb_i,
    input wire wbs_cyc_i,
    input wire wbs_we_i,
    //input [3:0] wbs_sel_i,
    //input [31:0] wbs_dat_i,
    //input [31:0] wbs_adr_i,
    //output wbs_ack_o,
    //output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    //input  [63:0] la_data_in,
    //output [63:0] la_data_out,
    //input  [63:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    //output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    //output [2:0] irq
);
    wire clk;
    wire rst;

    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    //wire [`MPRJ_IO_PADS-1:0] io_oeb;

    //wire [31:0] rdata; 
    //wire [31:0] wdata;
    wire [BITS-1:0] count;

    //wire valid;
    //wire [3:0] wstrb;
    //wire [31:0] la_write;

    // WB MI A
    //assign valid = wbs_cyc_i && wbs_stb_i; 
    //assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    //assign wbs_dat_o = rdata;
    //assign wdata = wbs_dat_i;

    // IO
    assign io_out = count;
    //assign io_oeb = {(`MPRJ_IO_PADS-1){rst}};

    // IRQ
    //assign irq = 3'b000;	// Unused

    // LA
    //assign la_data_out = {{(127-BITS){1'b0}}, count};
    // Assuming LA probes [63:32] are for controlling the count register  
    //assign la_write = ~la_oenb[63:32] & ~{BITS{valid}};
    // Assuming LA probes [65:64] are for controlling the count clk & reset  
    //assign clk = (~la_oenb[64]) ? la_data_in[64]: wb_clk_i;
    //assign rst = (~la_oenb[65]) ? la_data_in[65]: wb_rst_i;
    assign clk = wb_clk_i;
    assign rst = wb_rst_i;

    cntr #(
        .BITS(BITS)
    ) cntr(
        .clk(clk),
        .rst(rst),
        //.ready(wbs_ack_o),
        .ena(wbs_cyc_i),
        //.rdata(rdata),
        .sdata(io_in),
        //.wstrb(wstrb),
        //.la_write(la_write),
        //.la_input(la_data_in[63:32]),
        .sload(wbs_we_i),
        .sclear(wbs_stb_i),
        .q(io_out)
    );

endmodule


module cntr #(
    parameter BITS = 4
)(
    input clk,
    input ena,
    input rst,
    input sload,
    input sclear,
    input [BITS-1:0] sdata,
    output [BITS-1:0] q
);

    reg [BITS-1:0] q;

    always @(posedge clk or posedge rst) begin
        if (rst) q <= 0;
        else begin
            if (ena) begin
                if (sclear) q <= 0;
                else if (sload) q <= sdata;
                else q <= q + 1'b1;
            end
        end
    end

endmodule
`default_nettype wire