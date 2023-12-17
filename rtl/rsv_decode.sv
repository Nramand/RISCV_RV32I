import rsv_pkg::*;


module rsv_decode (

input  logic [31:0] inst_i,
output logic [4:0]  rs1_o,
output logic [4:0]  rs2_o,
output logic [4:0]  rd_o,
output logic [4:0]  op_o,
output logic [4:0]  funct3_o,
output logic [4:0]  funct7_o,
output logic        r_type_o,
output logic        i_type_o,
output logic        s_type_o,
output logic        b_type_o,
output logic        u_type_o,
output logic        j_type_o,
output logic [31:0] inst_imm_o
);

//---------------------------------------
//Signals needed 
//--------------------------------------


logic [4:0] op;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;
logic [4:0] funct3;
logic [4:0] funct7;

logic r_type;
logic i_type;
logic s_type;
logic b_type;
logic u_type;
logic j_type;



logic [31:0] r_type_inst;
logic [31:0] i_type_inst;
logic [31:0] s_type_inst;
logic [31:0] b_type_inst;
logic [31:0] u_type_inst;
logic [31:0] j_type_inst;
logic [31:0] inst_imm;


assign op     = inst_i[6:0];
assign rd     = inst_i[11:7];
assign funct3  = inst_i[14:12];
assign rs1    = inst_i[19:15];
assign rs2    = inst_i[24:20];
assign funct7 = inst_i[31:25];





assign i_type_inst = { {20{inst_i[31]}},inst_i[31:20]};
assign s_type_inst = { {20{inst_i[31]}},inst_i[31:25],inst_i[11:7]};
assign b_type_inst = { {21{inst_i[31]}},inst_i[6],inst_i[30:24],inst_i[11:7],1'b0}; // zeroth bit being zero need to check 
assign u_type_inst = {inst_i[31:12],{12'b0}};
assign j_type_inst = { {13{inst_i[31]}},inst_i[19:12],inst_i[20],inst_i[30:21],1'b0};

assign inst_imm    = r_type ? 32'b0  :
                     i_type ? i_type_inst :
                     s_type ? s_type_inst :
                     b_type ? b_type_inst :
                     u_type ? u_type_inst :
                                   j_type_inst ;    



always_comb
begin 
  r_type = 1'b0; 
  i_type = 1'b0; 
  s_type = 1'b0;
  b_type = 1'b0;
  u_type = 1'b0;
  j_type = 1'b0;
  
  case(op)
   R_TYPE    : r_type = 1'b1; 
   I_TYPE_0, 
   I_TYPE_1,
   I_TYPE_2  : i_type = 1'b1;  
   S_TYPE    : s_type = 1'b1;
   B_TYPE    : b_type = 1'b1;
   U_TYPE_0,
   U_TYPE_1  : u_type = 1'b1;
   J_TYPE    : j_type = 1'b1;
   default;                                                     
   endcase
end

//------------------------------------
//Output assignments
//
//-----------------------------------

assign inst_imm_o = inst_imm;
assign r_type_o   = r_type;   
assign i_type_o   = i_type;
assign s_type_o   = s_type;
assign b_type_o   = b_type;
assign u_type_o   = u_type; 
assign j_type_o   = j_type; 



endmodule 
