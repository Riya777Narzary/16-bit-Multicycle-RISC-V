`timescale 1ns/1ps


module BranchController(Branch_funct, branch, less, greater, zero, w);

    input branch, zero, less, greater;
    input [1:0] Branch_funct;
    
    parameter [1:0] BEQ = 2'b00, BNE = 2'b01, BLT = 2'b10,
                    BGE = 2'b11;

    output reg w;
    
    always@(*) begin
        case (Branch_funct)
            BEQ   : w = branch && zero;
            BNE   : w = branch && ~zero;
            BLT   : w = branch && less;
            BGE   : w = branch && greater;
        endcase
    end

endmodule