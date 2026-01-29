// f(x1,x2,x3,x4) = x1'x2'x3' + x1'x3'x4 + x1x2x4' + x2x3
// f'' = 

//NAND
module question_nand (
    input wire x1, x2, x3, x4,
    output wire out
);

    wire n1, n2, n3, n4;

    nand(n1, ~x1, ~x2, ~x3);
    nand(n2, ~x1, ~x3, x4);
    nand(n3, x1, x2, ~x4);
    nand(n4, x2, x3);

    nand(out, n1, n2, n3, n4);

endmodule

//NOR


module question_nor (
    input x1, x2, x3, x4,
    output out
);
    // 1. Literal Inversions (using NOR as NOT)
    wire n1, n2, n3, n4;
    nor (n1, x1, x1); // x1'
    nor (n2, x2, x2); // x2'
    nor (n3, x3, x3); // x3'
    nor (n4, x4, x4); // x4'

    // 2. Intermediate wires for each AND term 
    // Because we are using NOR-only, we implement the "AND" 
    // by feeding inverted inputs into a NOR gate.
    wire term_a, term_b, term_c, term_d;

    // Term A: x1'x2'x3' -> NOR(x1, x2, x3)
    nor (term_a, x1, x2, x3);

    // Term B: x1'x3'x4 -> NOR(x1, x3, n4)
    nor (term_b, x1, x3, n4);

    // Term C: x1x2x4' -> NOR(n1, n2, x4)
    nor (term_c, n1, n2, x4);

    // Term D: x2x3 -> NOR(n2, n3)
    nor (term_d, n2, n3);

    // 3. Final Sum (The "OR" of all terms)
    // To OR these together using NOR gates, we NOR them all, 
    // then invert the result.
    wire nor_sum;
    nor (nor_sum, term_a, term_b, term_c, term_d);
    nor (out, nor_sum, nor_sum); // Final inversion to get f

endmodule