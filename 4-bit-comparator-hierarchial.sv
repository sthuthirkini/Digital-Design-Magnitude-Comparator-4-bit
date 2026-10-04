module comp4(
    input  [3:0] A, B,
    output G, E, L
);

wire G3, E3, L3;
wire G2, E2, L2;
wire G1, E1, L1;
wire G0, E0, L0;

// Four 1-bit comparators
comp1 c3(A[3], B[3], G3, E3, L3);
comp1 c2(A[2], B[2], G2, E2, L2);
comp1 c1(A[1], B[1], G1, E1, L1);
comp1 c0(A[0], B[0], G0, E0, L0);

// Final comparison
assign G = G3 | (E3 & G2) | (E3 & E2 & G1) |
           (E3 & E2 & E1 & G0);

assign E = E3 & E2 & E1 & E0;

assign L = L3 | (E3 & L2) | (E3 & E2 & L1) |
           (E3 & E2 & E1 & L0);

endmodule
