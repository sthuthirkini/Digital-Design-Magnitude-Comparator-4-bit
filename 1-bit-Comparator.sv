// inputs:A,B
//oututs:signals G,L,E

//truth table helps derive equations

module onebit_compare( input logic a,input logic b,output logic g,e,l);
  assign g=a&(~b);
  assign e=~(a^b);
  assign l=(~a)&b;
endmodule;

module tb;

    logic a, b;
    logic g, e, l;

    // Connect the comparator to the testbench
    onebit_compare uut (
        .a(a),
        .b(b),
        .g(g),
        .e(e),
        .l(l)
    );

    initial begin

        // Test case 1: A = 0, B = 0
        a = 0; b = 0;
        #10;

        // Test case 2: A = 0, B = 1
        a = 0; b = 1;
        #10;

        // Test case 3: A = 1, B = 0
        a = 1; b = 0;
        #10;

        // Test case 4: A = 1, B = 1
        a = 1; b = 1;
        #10;

        $finish;
    end

    // Display results
    initial begin
        $monitor("A = %b, B = %b | G = %b, E = %b, L = %b",
                 a, b, g, e, l);
    end

endmodule
