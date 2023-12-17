package rsv_pkg;

typedef enum logic [6:0] {
    R_TYPE    = 7'b0110011,
    I_TYPE_0  = 7'b0000011,
    I_TYPE_1  = 7'b0010011,
    I_TYPE_2  = 7'b1100111,
    S_TYPE    = 7'b0100011,
    B_TYPE    = 7'b1100011,
    U_TYPE_0  = 7'b0110111,
    U_TYPE_1  = 7'b0010111,
    J_TYPE    = 7'b1101111
  } riscv_op_t;

endpackage
