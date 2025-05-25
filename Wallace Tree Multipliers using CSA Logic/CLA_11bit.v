module CLA_11bit(
    input [10:0] A,
    input [10:0] B,
    output [10:0] S,
    output Cout
    );

    wire [10:0] C, P, G;
    
    // Partial Full Adder - 1 
    assign C[0]=1'b0;
    PFA PFA0 (A[0],B[0],C[0],S[0],P[0],G[0]);
    
    // Partial Full Adder - 2
    assign C[1] = G[0]|(P[0]&C[0]);
    PFA PFA1 (A[1],B[1],C[1],S[1],P[1],G[1]);
    
    // Partial Full Adder - 3
    assign C[2] = G[1]|(P[1]&C[1]);
    PFA PFA2 (A[2],B[2],C[2],S[2],P[2],G[2]);
    
    // Partial Full Adder - 4
    assign C[3] = G[2]|(P[2]&C[2]);
    PFA PFA3 (A[3],B[3],C[3],S[3],P[3],G[3]);
    
    // Partial Full Adder - 5
    assign C[4] = G[3]|(P[3]&C[3]);
    PFA PFA4 (A[4],B[4],C[4],S[4],P[4],G[4]);
    
    // Partial Full Adder - 6
    assign C[5] = G[4]|(P[4]&C[4]);
    PFA PFA5 (A[5],B[5],C[5],S[5],P[5],G[5]);
    
    // Partial Full Adder - 7
    assign C[6] = G[5]|(P[5]&C[5]);
    PFA PFA6 (A[6],B[6],C[6],S[6],P[6],G[6]);
    
    // Partial Full Adder - 8
    assign C[7] = G[6]|(P[6]&C[6]);
    PFA PFA7 (A[7],B[7],C[7],S[7],P[7],G[7]);
    
    // Partial Full Adder - 9
    assign C[8] = G[7]|(P[7]&C[7]);
    PFA PFA8 (A[8],B[8],C[8],S[8],P[8],G[8]);
    
    // Partial Full Adder - 10
    assign C[9] = G[8]|(P[8]&C[8]);
    PFA PFA9 (A[9],B[9],C[9],S[9],P[9],G[9]);
    
    // Partial Full Adder - 11
    assign C[10] = G[9]|(P[9]&C[9]);
    PFA PFA10 (A[10],B[10],C[10],S[10],P[10],G[10]);

endmodule
