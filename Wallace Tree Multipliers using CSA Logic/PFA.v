module PFA(
    input A,
    input B,
    input C,
    output S,
    output P,
    output G
    );
    
    xor G1 (P, A, B);
    and G2 (G, A, B);
    xor G3 (S, P, C);
    
endmodule
