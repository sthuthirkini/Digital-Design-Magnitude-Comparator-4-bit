module tb_comparator_4bit;

    logic [3:0] A;
    logic [3:0] B;
    logic G, E, L;

    // DUT
    comparator_4bit uut (
        .A(A),
        .B(B),
        .G(G),
        .E(E),
        .L(L)
    );

    initial begin

        $monitor("A = %b | B = %b | G = %b | E = %b | L = %b",
                 A, B, G, E, L);

        // A > B
        A = 4'b1010;
        B = 4'b0111;
        #10;

        // A < B
        A = 4'b0101;
        B = 4'b1001;
        #10;

        // A = B
        A = 4'b1010;
        B = 4'b1010;
        #10;

        // MSB decides
        A = 4'b1000;
        B = 4'b0111;
        #10;

        // LSB decides
        A = 4'b1001;
        B = 4'b1000;
        #10;

        // Another equal case
        A = 4'b0000;
        B = 4'b0000;
        #10;

        $finish;
    end

endmodule

