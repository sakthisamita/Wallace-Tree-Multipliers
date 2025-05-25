module Wallace_Tree_Multiplier_4x4(
    input [3:0] A,
    input [3:0] B,
    output [7:0] Product
    );
    
    wire [12:1] S, C;
    wire a0b0, a0b1, a0b2, a0b3, a1b0, a1b1, a1b2, a1b3, a2b0, a2b1, a2b2, a2b3, a3b0, a3b1, a3b2, a3b3;
    
    and (a0b0, A[0], B[0]);
    and (a0b1, A[0], B[1]);
    and (a0b2, A[0], B[2]);
    and (a0b3, A[0], B[3]);
    and (a1b0, A[1], B[0]);
    and (a1b1, A[1], B[1]);
    and (a1b2, A[1], B[2]);
    and (a1b3, A[1], B[3]);
    and (a2b0, A[2], B[0]);
    and (a2b1, A[2], B[1]);
    and (a2b2, A[2], B[2]);
    and (a2b3, A[2], B[3]);
    and (a3b0, A[3], B[0]);
    and (a3b1, A[3], B[1]);
    and (a3b2, A[3], B[2]);
    and (a3b3, A[3], B[3]);  
    
    Half_Adder HA1 (a2b1, a3b0, S[1], C[1]);
    Half_Adder HA2 (a2b2, a3b1, S[2], C[2]);
    Half_Adder HA3 (a1b1, a2b0, S[3], C[3]);
    Full_Adder FA4 (S[1], a0b3, a1b2, S[4], C[4]);
    Full_Adder FA5 (C[1], S[2], a1b3, S[5], C[5]);
    Full_Adder FA6 (C[2], a2b3, a3b2, S[6], C[6]);
    Half_Adder HA7 (a0b1, a1b0, S[7], C[7]);
    Full_Adder FA8 (S[3], a0b2, C[7], S[8], C[8]);
    Full_Adder FA9 (C[3], S[4], C[8], S[9], C[9]);
    Full_Adder FA10 (C[4], S[5], C[9], S[10], C[10]);
    Full_Adder FA11 (C[5], S[6], C[10], S[11], C[11]);
    Full_Adder FA12 (C[6], a3b3, C[11], S[12], C[12]);
    
    assign Product [0] = a0b0;
    assign Product [1] = S[7];
    assign Product [2] = S[8];
    assign Product [3] = S[9];
    assign Product [4] = S[10];
    assign Product [5] = S[11];
    assign Product [6] = S[12];
    assign Product [7] = C[12];
      
endmodule
