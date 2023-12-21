
module rsv_regfile (
input         clk,
input         reset_n,
input  [5:0]  waddr_i,
input  [31:0] data_i,
input         wr_en_i,
input  [7:0]  raddr0_i,
input  [7:0]  raddr1_i,
output [31:0] data0_out_o,
output [31:0] data1_out_o 

);
/////////
//XLEN - 32 hence 32 registers 
/////////

logic [31:0] rf_mem [31:0];

always_ff @(posedge clk) 
 if (wr_en_i)
 begin
    if (waddr_i == 32'd0) 
       rf_mem[waddr_i] <= 32'd0; //As per architecture X0 data is zero 
    else
       rf_mem[waddr_i] <= data_i;
 end
//assign data0_out_o = rf_mem[raddr0_i]; // two channels because an instruction can access two registers at a time (rs1, and rs2)
//assign data1_out_o = rf_mem[raadr1_i];

endmodule  
