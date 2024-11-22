`timescale 1ns/1ps

`define ADD 3'b000
`define SUB 3'b001
`define AND 3'b010
`define OR  3'b011
`define SLT 3'b101
`define XOR 3'b100
`define SRT 3'b110

module ALU(ALUControl, a, b, zero, less, greater, w);
    parameter N = 16;

    input [2:0] ALUControl;
    input signed [N-1:0] a, b;
    
    output zero, less, greater;
    output reg signed [N-1:0] w;
    
    always @(*) begin
        case (ALUControl)
            `ADD   :  w = a + b;
            `SUB   :  w = a - b;
            `AND   :  w = a & b;
            `OR    :  w = a | b;
            `SLT   :  w = $signed(a) < $signed(b) ? 16'd1 : 16'd0;
            `XOR   :  w = a ^ b;
            `SRT   :  w = $signed(a) >= $signed(b) ? 16'd1 : 16'd0;
            default:  w = {N{1'b0}};
        endcase
    end

    assign zero = (~|w);
    assign less = (|w);
    assign greater = |w;

endmodule