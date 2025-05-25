module Wallace_Tree_Multiplier_8x8(
    input [7:0] A,
    input [7:0] B,
    output [15:0] Product
    );
    
    // Partial products terms
    wire p00, p01, p02, p03, p04, p05, p06, p07;
    wire p10, p11, p12, p13, p14, p15, p16, p17;
    wire p20, p21, p22, p23, p24, p25, p26, p27;
    wire p30, p31, p32, p33, p34, p35, p36, p37;
    wire p40, p41, p42, p43, p44, p45, p46, p47;
    wire p50, p51, p52, p53, p54, p55, p56, p57;
    wire p60, p61, p62, p63, p64, p65, p66, p67;
    wire p70, p71, p72, p73, p74, p75, p76, p77;
    
    assign p00 = A[0] & B[0];
    assign p01 = A[0] & B[1];
    assign p02 = A[0] & B[2];
    assign p03 = A[0] & B[3];
    assign p04 = A[0] & B[4];
    assign p05 = A[0] & B[5];
    assign p06 = A[0] & B[6];
    assign p07 = A[0] & B[7];
    
    assign p10 = A[1] & B[0];
    assign p11 = A[1] & B[1];
    assign p12 = A[1] & B[2];
    assign p13 = A[1] & B[3];
    assign p14 = A[1] & B[4];
    assign p15 = A[1] & B[5];
    assign p16 = A[1] & B[6];
    assign p17 = A[1] & B[7];
   
    assign p20 = A[2] & B[0];
    assign p21 = A[2] & B[1];
    assign p22 = A[2] & B[2];
    assign p23 = A[2] & B[3];
    assign p24 = A[2] & B[4];
    assign p25 = A[2] & B[5];
    assign p26 = A[2] & B[6];
    assign p27 = A[2] & B[7];
   
    assign p30 = A[3] & B[0];
    assign p31 = A[3] & B[1];
    assign p32 = A[3] & B[2];
    assign p33 = A[3] & B[3];
    assign p34 = A[3] & B[4];
    assign p35 = A[3] & B[5];
    assign p36 = A[3] & B[6];
    assign p37 = A[3] & B[7];
   
    assign p40 = A[4] & B[0];
    assign p41 = A[4] & B[1];
    assign p42 = A[4] & B[2];
    assign p43 = A[4] & B[3];
    assign p44 = A[4] & B[4];
    assign p45 = A[4] & B[5];
    assign p46 = A[4] & B[6];
    assign p47 = A[4] & B[7];
   
    assign p50 = A[5] & B[0];
    assign p51 = A[5] & B[1];
    assign p52 = A[5] & B[2];
    assign p53 = A[5] & B[3];
    assign p54 = A[5] & B[4];
    assign p55 = A[5] & B[5];
    assign p56 = A[5] & B[6];
    assign p57 = A[5] & B[7];
    
    assign p60 = A[6] & B[0];
    assign p61 = A[6] & B[1];
    assign p62 = A[6] & B[2];
    assign p63 = A[6] & B[3];
    assign p64 = A[6] & B[4];
    assign p65 = A[6] & B[5];
    assign p66 = A[6] & B[6];
    assign p67 = A[6] & B[7];
   
    assign p70 = A[7] & B[0];
    assign p71 = A[7] & B[1];
    assign p72 = A[7] & B[2];
    assign p73 = A[7] & B[3];
    assign p74 = A[7] & B[4];
    assign p75 = A[7] & B[5];
    assign p76 = A[7] & B[6];
    assign p77 = A[7] & B[7];
    
    wire [52:0] S, C;
    
    // CSA-1
    Half_Adder HA0 (p10, p01, S[0], C[0]);
    Full_Adder FA1 (p20, p11, p02, S[1], C[1]);
    Full_Adder FA2 (p30, p21, p12, S[2], C[2]);
    Full_Adder FA3 (p40, p31, p22, S[3], C[3]);
    Full_Adder FA4 (p50, p41, p32, S[4], C[4]);
    Full_Adder FA5 (p60, p51, p42, S[5], C[5]);
    Full_Adder FA6 (p70, p61, p52, S[6], C[6]);
    Half_Adder HA7 (p71, p62, S[7], C[7]);
    
    // CSA-2
    Half_Adder HA8 (p13, p04, S[8], C[8]);
    Full_Adder FA9 (p23, p14, p05, S[9], C[9]);
    Full_Adder FA10 (p33, p24, p15, S[10], C[10]);
    Full_Adder FA11 (p43, p34, p25, S[11], C[11]);
    Full_Adder FA12 (p53, p44, p35, S[12], C[12]);
    Full_Adder FA13 (p63, p54, p45, S[13], C[13]);
    Full_Adder FA14 (p73, p64, p55, S[14], C[14]);
    Half_Adder HA15 (p74, p65, S[15], C[15]);
    
    // CSA-3
    Half_Adder HA16 (S[1], C[0], S[16], C[16]);
    Full_Adder FA17 (S[2], C[1], p03, S[17], C[17]);
    Full_Adder FA18 (S[3], C[2], S[8], S[18], C[18]);
    Full_Adder FA19 (S[4], C[3], S[9], S[19], C[19]);
    Full_Adder FA20 (S[5], C[4], S[10], S[20], C[20]);
    Full_Adder FA21 (S[6], C[5], S[11], S[21], C[21]);
    Full_Adder FA22 (S[7], C[6], S[12], S[22], C[22]);
    Full_Adder FA23 (p72, C[7], S[13], S[23], C[23]);
    
    // CSA-4
    Half_Adder HA24 (C[9], p06, S[24], C[24]);
    Full_Adder FA25 (C[10], p16, p07, S[25], C[25]);
    Full_Adder FA26 (C[11], p26, p17, S[26], C[26]);
    Full_Adder FA27 (C[12], p36, p27, S[27], C[27]);
    Full_Adder FA28 (C[13], p46, p37, S[28], C[28]);
    Full_Adder FA29 (C[14], p56, p47, S[29], C[29]);
    Full_Adder FA30 (C[15], p66, p57, S[30], C[30]);
    Half_Adder HA31 (p76, p67, S[31], C[31]);
    
    // CSA-5
    Half_Adder HA32 (S[17], C[16], S[32], C[32]);
    Half_Adder HA33 (S[18], C[17], S[33], C[33]);
    Full_Adder FA34 (S[19], C[18], C[8], S[34], C[34]);
    Full_Adder FA35 (S[20], C[19], S[24], S[35], C[35]);
    Full_Adder FA36 (S[21], C[20], S[25], S[36], C[36]);
    Full_Adder FA37 (S[22], C[21], S[26], S[37], C[37]);
    Full_Adder FA38 (S[23], C[22], S[27], S[38], C[38]);
    Full_Adder FA39 (S[14], C[23], S[28], S[39], C[39]);
    Half_Adder HA40 (S[15], S[29], S[40], C[40]);
    Half_Adder HA41 (p75, S[30], S[41], C[41]);
    
    // CSA-6
    Half_Adder HA42 (S[33], C[32], S[42], C[42]);
    Half_Adder HA43 (S[34], C[33], S[43], C[43]);
    Half_Adder HA44 (S[35], C[34], S[44], C[44]);
    Full_Adder FA45 (S[36], C[35], C[24], S[45], C[45]);
    Full_Adder FA46 (S[37], C[36], C[25], S[46], C[46]);
    Full_Adder FA47 (S[38], C[37], C[26], S[47], C[47]);
    Full_Adder FA48 (S[39], C[38], C[27], S[48], C[48]);
    Full_Adder FA49 (S[40], C[39], C[28], S[49], C[49]);
    Full_Adder FA50 (S[41], C[40], C[29], S[50], C[50]);
    Full_Adder FA51 (S[31], C[41], C[30], S[51], C[51]);
    Half_Adder HA52 (p77, C[31], S[52], C[52]);
    
    wire [10:0] CLA_A, CLA_B, CLA_S;
    wire Cout;
    assign CLA_A = {1'b0, S[52],S[51], S[50], S[49], S[48], S[47], S[46], S[45], S[44], S[43]};
    assign CLA_B = {C[52], C[51], C[50], C[49], C[48], C[47], C[46], C[45], C[44], C[43], C[42]};
    CLA_11bit CLA (CLA_A, CLA_B, CLA_S, Cout);
    assign Product = {CLA_S, S[42], S[32], S[16], S[0], p00};  
    
endmodule
