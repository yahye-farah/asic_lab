// f = x1'x2'x4' + x1x2x3 + x1x4 + x2'x3'x4' + x2x3'x4

//NAND
module question_nand (
    input wire x1, x2, x3, x4,
    output wire out
);

    wire n1, n2, n3, n4, n5;

    nand(n1, ~x1, ~x2, ~x4); 
    nand(n2, x1, x2, x3); 
    nand(n3, x1, x4);  
    nand(n4, ~x2, ~x3, ~x4);    
    nand(n5, x2, ~x3, x4);    
    nand(out, n1, n2, n3, n4, n5);

endmodule

//NOR

// f(x1x2x3x4) = (x1'+x2+x3'+x4)(x1+x2'+x3')(x1+x2+x4')+(x2'+x3+x4)


module question_nor (
    input x1, x2, x3, x4,
    output out
);
    wire x1_n, x2_n, x3_n, x4_n;
    wire t1_n, t2_n, t3_n, t4_n;


    // 2. Generate the inverted sum terms
    nor (t1_n, ~x1, x2, ~x3, x4);
    nor (t2_n, x1, ~x2, ~x3);    
    nor (t3_n, x1, x2, ~x4);       	
    nor (t4_n, ~x2, x3, x4);  

    // 3. The "Magic" Step: NORing the inverted terms gives the product
    // f = (t1_n + t2_n + t3_n)' = t1_n' * t2_n' * t3_n' = (Sum1) * (Sum2) * (Sum3)
    nor (out, t1_n, t2_n, t3_n, t4_n);

endmodule
