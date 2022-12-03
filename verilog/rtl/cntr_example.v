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
    parameter BITS = 20
)(
`ifdef USE_POWER_PINS
    inout vdd,	// User area 1 1.8V supply
    inout vss,	// User area 1 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wire wb_clk_i,
    input wire wb_rst_i,
    //input wire wbs_stb_i,
    //input wire wbs_cyc_i,
    //input wire wbs_we_i,
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
    //input  [`MPRJ_IO_PADS-1:0] io_in,
    output [`MPRJ_IO_PADS-1:0] io_out,
    //output [`MPRJ_IO_PADS-1:0] io_oeb,

    // IRQ
    //output [2:0] irq
);
    wire clk;
    wire rst;

    //wire [`MPRJ_IO_PADS-1:0] io_in;
    //wire [`MPRJ_IO_PADS-1:0] io_out;
    //wire [`MPRJ_IO_PADS-1:0] io_oeb;

    //wire [31:0] rdata; 
    //wire [31:0] wdata;
    //wire [BITS-1:0] count;

    //wire valid;
    //wire [3:0] wstrb;
    //wire [31:0] la_write;

    // WB MI A
    //assign valid = wbs_cyc_i && wbs_stb_i; 
    //assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    //assign wbs_dat_o = rdata;
    //assign wdata = wbs_dat_i;

    // IO
    //assign io_out = count;
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

    cntr_1 #(
        .BITS(BITS)
    ) cntr_1(
        .clk(clk),
        .rstn(rst),
        .out1(io_out[BITS-17:0])
    );

    cntr_2 #(
        .BITS(BITS)
    ) cntr_2(
        .clk(clk),
        .rstn(rst),
        .out2(io_out[BITS-13:BITS-16])
    );

    cntr_3 #(
        .BITS(BITS)
    ) cntr_3(
        .clk(clk),
        .rstn(rst),
        .out3(io_out[BITS-9:BITS-12])
    );

    cntr_4 #(
        .BITS(BITS)
    ) cntr_4(
        .clk(clk),
        .rstn(rst),
        .out4(io_out[BITS-5:BITS-8])
    );

    cntr_5 #(
        .BITS(BITS)
    ) cntr_5(
        .clk(clk),
        .rstn(rst),
        .out5(io_out[BITS-1:BITS-4])
    );

    // cntr_6 #(
    //     .BITS(BITS)
    // ) cntr_6(
    //     .clk(clk),
    //     .rstn(rst),
    //     .out6(io_out[BITS-13:BITS-16])
    // );

    // cntr_7 #(
    //     .BITS(BITS)
    // ) cntr_7(
    //     .clk(clk),
    //     .rstn(rst),
    //     .out7(io_out[BITS-9:BITS-6])
    // );

    // cntr_8 #(
    //     .BITS(BITS)
    // ) cntr_8(
    //     .clk(clk),
    //     .rstn(rst),
    //     .out8(io_out[BITS-5:BITS-8])
    // );

    // cntr_9 #(
    //     .BITS(BITS)
    // ) cntr_9(
    //     .clk(clk),
    //     .rstn(rst),
    //     .out9(io_out[BITS-1:BITS-4])
    // );

endmodule

module cntr_1 #(
    parameter BITS=4
)(
    input clk,      // Declare input port for the clock to allow counter to count up  
    input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
    output reg[BITS-1:0] out1 // Declare 4-bit output port to get the counter values 
);     
  
 // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clk) begin  
    if (! rstn)  
      out1 <= 0;  
    else  
      out1 <= out1 + 1;  
  end  
endmodule

module cntr_2 #(
    parameter BITS=4
)(
    input clk,      // Declare input port for the clock to allow counter to count up  
    input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
    output reg[BITS-1:0] out2 // Declare 4-bit output port to get the counter values 
);     
  
 // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clk) begin  
    if (! rstn)  
      out2 <= 0;  
    else  
      out2 <= out2 + 1;  
  end  
endmodule

module cntr_3 #(
    parameter BITS=4
)(
    input clk,      // Declare input port for the clock to allow counter to count up  
    input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
    output reg[BITS-1:0] out3 // Declare 4-bit output port to get the counter values 
);     
  
 // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clk) begin  
    if (! rstn)  
      out3 <= 0;  
    else  
      out3 <= out3 + 1;  
  end  
endmodule

module cntr_4 #(
    parameter BITS=4
)(
    input clk,      // Declare input port for the clock to allow counter to count up  
    input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
    output reg[BITS-1:0] out4 // Declare 4-bit output port to get the counter values 
);     
  
 // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clk) begin  
    if (! rstn)  
      out4 <= 0;  
    else  
      out4 <= out4 + 1;  
  end  
endmodule

module cntr_5 #(
    parameter BITS=4
)(
    input clk,      // Declare input port for the clock to allow counter to count up  
    input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
    output reg[BITS-1:0] out5 // Declare 4-bit output port to get the counter values 
);     
  
 // This always block will be triggered at the rising edge of clk (0->1)  
  // Once inside this block, it checks if the reset is 0, then change out to zero   
  // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
  always @ (posedge clk) begin  
    if (! rstn)  
      out5 <= 0;  
    else  
      out5 <= out5 + 1;  
  end  
endmodule

// module cntr_6 #(
//     parameter BITS=4
// )(
//     input clk,      // Declare input port for the clock to allow counter to count up  
//     input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
//     output reg[BITS-1:0] out6 // Declare 4-bit output port to get the counter values 
// );     
  
//  // This always block will be triggered at the rising edge of clk (0->1)  
//   // Once inside this block, it checks if the reset is 0, then change out to zero   
//   // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
//   always @ (posedge clk) begin  
//     if (! rstn)  
//       out6 <= 0;  
//     else  
//       out6 <= out6 + 1;  
//   end  
// endmodule

// module cntr_7 #(
//     parameter BITS=4
// )(
//     input clk,      // Declare input port for the clock to allow counter to count up  
//     input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
//     output reg[BITS-1:0] out7 // Declare 4-bit output port to get the counter values 
// );     
  
//  // This always block will be triggered at the rising edge of clk (0->1)  
//   // Once inside this block, it checks if the reset is 0, then change out to zero   
//   // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
//   always @ (posedge clk) begin  
//     if (! rstn)  
//       out7 <= 0;  
//     else  
//       out7 <= out7 + 1;  
//   end  
// endmodule

// module cntr_8 #(
//     parameter BITS=4
// )(
//     input clk,      // Declare input port for the clock to allow counter to count up  
//     input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
//     output reg[BITS-1:0] out8 // Declare 4-bit output port to get the counter values 
// );     
  
//  // This always block will be triggered at the rising edge of clk (0->1)  
//   // Once inside this block, it checks if the reset is 0, then change out to zero   
//   // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
//   always @ (posedge clk) begin  
//     if (! rstn)  
//       out8 <= 0;  
//     else  
//       out8 <= out8 + 1;  
//   end  
// endmodule

// module cntr_9 #(
//     parameter BITS=4
// )(
//     input clk,      // Declare input port for the clock to allow counter to count up  
//     input rstn,              // Declare input port for the reset to allow the counter to be reset to 0 when required  
//     output reg[BITS-1:0] out9 // Declare 4-bit output port to get the counter values 
// );     
  
//  // This always block will be triggered at the rising edge of clk (0->1)  
//   // Once inside this block, it checks if the reset is 0, then change out to zero   
//   // If reset is 1, then the design should be allowed to count up, so increment the counter   
  
//   always @ (posedge clk) begin  
//     if (! rstn)  
//       out9 <= 0;  
//     else  
//       out9 <= out9 + 1;  
//   end  
// endmodule

`default_nettype wire