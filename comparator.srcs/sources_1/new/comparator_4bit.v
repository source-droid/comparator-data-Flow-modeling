`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2020 05:20:35 PM
// Design Name: 
// Module Name: comparator_4bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module comparator_4bit(A, B, A_gt_B, A_lt_B, A_eq_B);

input [3:0]A,B;
output A_gt_B, A_lt_B, A_eq_B;
wire [3:0]X;
assign X[0] = A[0] & B[0] | ~A[0] & ~B[0];
assign X[1] = A[1] & B[1] | ~A[1] & ~B[1];
assign X[2] = A[2] & B[2] | ~A[2] & ~B[2];
assign X[3] = A[3] & B[3] | ~A[3] & ~B[3];


assign A_gt_B = A[3] & ~B[3] | X[3] & A[2] & ~B[2] | X[3] & X[2] & A[1] & ~B[1] | X[3] & X[2] & X[1] & A[0] & ~B[0];

assign A_lt_B = ~A[3] & B[3] | X[3] & ~A[2] & B[2] | X[3] & X[2] & ~A[1] & B[1] | X[3] & X[2] & X[1] & ~A[0] & B[0];

assign A_eq_B =  X[3] & X[2] & X[1] & X[0];


endmodule
