module CLA_4bit(
    input [3:0] A,
    input [3:0] B,
    output [3:0] S,
    output Carry
    );
    
    wire [3:0] C, P, G;
    
    // Partial Full Adder - 1 
    assign C[0]=1'b0;
    PFA PFA0 (A[0],B[0],C[0],S[0],P[0],G[0]);
    
    // Partial Full Adder - 2
    assign C[1] = G[0]|(P[0]&C[0]);
    PFA PFA1 (A[1],B[1],C[1],S[1],P[1],G[1]); 
    
    // Partial Full Adder - 3
    assign C[2] = G[1]|(P[1]&C[1]);
    PFA PFA2 (A[2],B[2],C[2],S[2],P[2],G[2]);
    
    // Partial Full Adder - 3
    assign C[3] = G[2]|(P[2]&C[2]);
    PFA PFA3 (A[3],B[3],C[3],S[3],P[3],G[3]);
    
    assign Carry = G[3]|(P[3]&C[3]);
    
endmodule
