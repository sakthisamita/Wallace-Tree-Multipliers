`timescale 1ns / 1ps

module Wallace_Tree_Multiplier_4x4_TB;

    reg [3:0] A;
    reg [3:0] B;
    wire [7:0] Product;
    
    Wallace_Tree_Multiplier_4x4 uut (A,B,Product);
    
    initial 
        begin
            A=0; B=0;
            #20 A=5; B=7;
            #20 A=6;
            #20 B=13;
            #20 A=15;
            #20 B=12;
            #20 A=10;
            #20 B=1;
            #20 A=11;
            #20 B=6;
            #20 A=7;
            #20 B=3;
            #20 A=9;
            #20 B=15;
            #20 A=15;
            $finish;
        end
            
endmodule
