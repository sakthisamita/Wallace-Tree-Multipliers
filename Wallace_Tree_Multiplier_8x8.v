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
    
    // Sum and Carry wires
    wire S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16, S17, S18, S19, S20, S21, S22, S23, S24, S25, S26, S27, S28, S29, S30, S31, S32, S33, S34, S35, S36, S37, S38, S39, S40, S41, S42, S43, S44, S45, S46, S47, S48, S49, S50, S51, S52, S53, S54, S55, S56;
    wire C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18, C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31, C32, C33, C34, C35, C36, C37, C38, C39, C40, C41, C42, C43, C44, C45, C46, C47, C48, C49, C50, C51, C52, C53, C54, C55, C56;
    
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
   
   // Stage 1 
   Half_Adder HA1 (p61,p70,S1,C1);
   Half_Adder HA2 (p62,p71,S2,C2);
   
   // Stage 2
   Half_Adder HA3 (p51,p60,S3,C3);
   Full_Adder FA4 (p34,p43,p52,S4,C4);
   Full_Adder FA5 (p35,p44,p53,S5,C5);
   Full_Adder FA6 (p54,p63,p72,S6,C6);
   
   // Stage 3
   Half_Adder HA7 (p41,p50,S7,C7);
   Full_Adder FA8 (p24,p33,p42,S8,C8);
   Full_Adder FA9 (p25,p16,p07,S9,C9); 
   Full_Adder FA10 (S2,p17,p26,S10,C10);
   Full_Adder FA11 (p45,p36,p27,S11,C11);
   Full_Adder FA12 (p55,p64,p73,S12,C12);
   
   // Stage 4
   Half_Adder HA13 (p31,p40,S13,C13);
   Full_Adder FA14 (p14,p23,p32,S14,C14);
   Full_Adder FA15 (p15,p06,S3,S15,C15);
   Full_Adder FA16 (C3,S4,S1,S16,C16);
   Full_Adder FA17 (C4,S5,C1,S17,C17);
   Full_Adder FA18 (C5,S6,C2,S18,C18);
   Full_Adder FA19 (C6,p37,p46,S19,C19);
   Full_Adder FA20 (p56,p65,p74,S20,C20);
   
   // Stage 5
   Half_Adder HA21 (p21,p30,S21,C21);
   Full_Adder FA22 (p04,p13,p22,S22,C22);
   Full_Adder FA23 (S14,S7,p05,S23,C23);
   Full_Adder FA24 (S15,C7,S8,S24,C24);
   Full_Adder FA25 (S16,C8,S9,S25,C25);
   Full_Adder FA26 (S17,C9,S10,S26,C26);
   Full_Adder FA27 (S18,C10,S11,S27,C27);
   Full_Adder FA28 (S19,C11,S12,S28,C28);
   Full_Adder FA29 (S20,C12,p47,S29,C29);
   Full_Adder FA30 (p57,p66,p75,S30,C30);

    // Stage 6
   Half_Adder HA31 (p11,p20,S31,C31);
   Full_Adder FA32 (p03,p12,S21,S32,C32);
   Full_Adder FA33 (C21,S22,S13,S33,C33);
   Full_Adder FA34 (C22,S23,C13,S34,C34);
   Full_Adder FA35 (C23,S24,C14,S35,C35);
   Full_Adder FA36 (C24,S25,C15,S36,C36);
   Full_Adder FA37 (C25,S26,C16,S37,C37);
   Full_Adder FA38 (C26,S27,C17,S38,C38);
   Full_Adder FA39 (C27,S28,C18,S39,C39);
   Full_Adder FA40 (C28,S29,C19,S40,C40);
   Full_Adder FA41 (C29,S30,C20,S41,C41);
   Full_Adder FA42 (C30,p67,p76,S42,C42);
   
   // Stage 7
   Half_Adder HA43 (p01,p10,S43,C43);
   Full_Adder FA44 (S31,p02,C43,S44,C44);
   Full_Adder FA45 (C31,S32,C44,S45,C45);
   Full_Adder FA46 (C32,S33,C45,S46,C46);
   Full_Adder FA47 (C33,S34,C46,S47,C47);
   Full_Adder FA48 (C34,S35,C47,S48,C48);
   Full_Adder FA49 (C35,S36,C48,S49,C49);
   Full_Adder FA50 (C36,S37,C49,S50,C50);
   Full_Adder FA51 (C37,S38,C50,S51,C51);
   Full_Adder FA52 (C38,S39,C51,S52,C52);
   Full_Adder FA53 (C39,S40,C52,S53,C53);
   Full_Adder FA54 (C40,S41,C53,S54,C54); 
   Full_Adder FA55 (C41,S42,C54,S55,C55);
   Full_Adder FA56 (C42,p77,C55,S56,C56); 
   
   assign Product = {C56, S56, S55, S54, S53, S52, S51, S50, S49, S48, S47, S46, S45, S44, S43, p00};
    
endmodule
