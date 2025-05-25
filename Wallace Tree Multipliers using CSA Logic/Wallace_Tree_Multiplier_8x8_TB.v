`timescale 1ns / 1ps

module Wallace_Tree_Multiplier_8x8_TB;

    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] Product;
    
    Wallace_Tree_Multiplier_8x8 uut (A,B,Product);
    
    initial 
        begin
            A=0; B=0;
            #20 A=5; B=7;
            #20 A=16;
            #20 B=213;
            #20 A=115;
            #20 B=12;
            #20 A=210;
            #20 B=11;
            #20 A=101;
            #20 B=216;
            #20 A=127;
            #20 B=223;
            #20 A=29;
            #20 B=255;
            #20 A=255;
            $finish;
        end
            
endmodule