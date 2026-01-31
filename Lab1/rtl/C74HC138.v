module C74HC138(
    input wire A, B, C, E1, E2, E3,
    output wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7
);
    wire EN;
    and (EN, E1, ~E2, ~E3);
    nand (Y0, EN, ~A, ~B, ~C);
    nand (Y1, EN, ~A, ~B, C);
    nand (Y2, EN, ~A, B, ~C);
    nand (Y3, EN, ~A, B, C);
    nand (Y4, EN, A, ~B, ~C);
    nand (Y5, EN, A, ~B, C);
    nand (Y6, EN, A, B, ~C);
    nand (Y7, EN, A, B, C); 

endmodule