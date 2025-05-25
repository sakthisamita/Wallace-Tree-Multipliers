module Wallace_Tree_Multiplier_4x4(
    input [3:0] A,
    input [3:0] B,
    output [8:0] Product
    );
    
    wire AB00, AB10, AB20, AB30;
    wire AB01, AB11, AB21, AB31;
    wire AB02, AB12, AB22, AB32;
    wire AB03, AB13, AB23, AB33;
    wire [7:0] S, C;
    
    assign AB00 = A[0] & B[0];
    assign AB10 = A[1] & B[0];
    assign AB20 = A[2] & B[0];
    assign AB30 = A[3] & B[0]; 
    assign AB01 = A[0] & B[1];
    assign AB11 = A[1] & B[1];
    assign AB21 = A[2] & B[1];
    assign AB31 = A[3] & B[1]; 
    assign AB02 = A[0] & B[2];
    assign AB12 = A[1] & B[2];
    assign AB22 = A[2] & B[2];
    assign AB32 = A[3] & B[2]; 
    assign AB03 = A[0] & B[3];
    assign AB13 = A[1] & B[3];
    assign AB23 = A[2] & B[3];
    assign AB33 = A[3] & B[3];    
            
    // CSA-1 6-bit
    //wire [6:0] CSA1_S, CSA1_C;
    Half_Adder HA0 (AB10,AB01,S[0],C[0]);
    Full_Adder FA1 (AB20,AB11,AB02,S[1],C[1]);
    Full_Adder FA2 (AB30,AB21,AB12,S[2],C[2]);
    Half_Adder HA3 (AB31,AB22,S[3],C[3]);
    //assign CSA1_S = {1'b0, AB2[3], S[3], S[2], S[1], S[0], AB0[0]};
    //assign CSA1_C = {1'b0, C[3], C[2], C[1], C[0], 2'b00};
    
    // CSA-2 7-bit
    //wire [7:0] CSA2_S, CSA2_C;
    Half_Adder HA4 (S[1],C[0],S[4],C[4]);
    Full_Adder FA5 (S[2],C[1],AB03,S[5],C[5]);
    Full_Adder FA6 (S[3],C[2],AB13,S[6],C[6]);
    Full_Adder FA7 (AB32,C[3],AB23,S[7],C[7]);
    //assign CSA2_S = {1'b0, AB3[3], S[7], S[6], S[5], S[4], S[0], AB0[0]};
    //assign CSA2_C = {1'b0, C[7], C[6], C[5], C[4], 3'b0};
    
    wire [3:0] CLA_A, CLA_B, CLA_S;
    wire CLA_C;
    assign CLA_A = {AB33,S[7],S[6],S[5]};
    assign CLA_B = {C[7], C[6], C[5], C[4]};     
    CLA_4bit CLA (CLA_A,CLA_B,CLA_S,CLA_C);
    assign Product = {CLA_C, CLA_S, S[4], S[0], AB00};
        
endmodule
