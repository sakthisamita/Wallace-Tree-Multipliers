module Half_Adder(
    input A,
    input B,
    output Sum,
    output Carry);
    
    xor (Sum, A, B);
    and (Carry, A, B);
    
endmodule
