//2 inputs A and B -4 bit busses
//3 outpus:G,L,E 

//Comparison goes from MSB to LSB bitwise

//equations are obtained from analysis 
//what all cases contribute to g=1 : either the leftmost bit being 1 or ,as we progress from left to right,the bits are either equal and end at bit in a being more than that in b

module(input logic [3:0]A,input logic[3:0] B,
       output logic G, output logic E, output logic L ); 
  logic E3, E2, E1, E0; 
  // Equality of individual bits 
  assign E3 = ~(A[3] ^ B[3]);
  assign E2 = ~(A[2] ^ B[2]); 
  assign E1 = ~(A[1] ^ B[1]); 
  assign E0 = ~(A[0] ^ B[0]);
  // A > B 
  assign G = (A[3] & ~B[3]) | (E3 & A[2] & ~B[2]) | (E3 & E2 & A[1] & ~B[1]) | (E3 & E2 & E1 & A[0] & ~B[0]); 
  
  // A = B 
  assign E = E3 & E2 & E1 & E0; 
  
  // A < B 
  assign L = (~A[3] & B[3]) | (E3 & ~A[2] & B[2]) | (E3 & E2 & ~A[1] & B[1]) | (E3 & E2 & E1 & ~A[0] & B[0]);

endmodule

