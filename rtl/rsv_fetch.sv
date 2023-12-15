
module rsv_fetch (

input  logic           clk,
input  logic           reset_n,

input  logic  [31:0]   pc_i, 

// Output read request to Instruction Memory 
output logic           fetch_mem_req_o,	
output logic  [31:0]   fetch_mem_addr_o,

//Read Data from the Memory 
input  logic  [31:0]   mem_rd_inst_i,

//Instruction output 
output logic  [31:0]  fetch_mem_inst_o
);

   //--------------------------
   // Internal signal
   //-------------------------
  logic fetch_mem_req_q;
  
  // Assert valid always since the processor will need a new
  // instruction every cycle out from reset 
  
  always_ff @(posedge clk or negedge reset_n)
  begin 
      if(!reset_n) begin 
         fetch_mem_req_q <= 1'b0;
      end
      else begin 
         fetch_mem_req_q <= 1'b1;
      end
  end
  
  
  assign fetch_mem_req_o  = fetch_mem_req_q;
  assign fetch_mem_addr_o = pc_i;
  
  // Memory read data contains the instruction to be processed 
  assign fetch_mem_inst_o = mem_rd_inst_i;

endmodule 
