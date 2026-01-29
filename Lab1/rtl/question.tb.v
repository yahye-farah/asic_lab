
module tb_all;
    reg x1, x2, x3, x4;
    wire out_nand, out_nor;
    integer i;

    question_nand dut_nand(.x1(x1), .x2(x2), .x3(x3), .x4(x4), .out(out_nand));
    question_nor  dut_nor(.x1(x1), .x2(x2), .x3(x3), .x4(x4), .out(out_nor));

    initial begin
        $dumpfile("nor_nand.vcd");
        $dumpvars(0, tb_all);
        $display("x1 x2 x3 x4 | NAND     | NOR");
        $display("-----------------------------");

        for ( i = 0 ; i < 16 ; i += 1 ) begin
            {x1, x2, x3, x4} = i[3:0];
            #10;

            $display("%b %b %b %b     | NAND: %b  | NOR: %b", x1, x2, x3, x4, out_nand, out_nor);
        end
        
        $finish;
    end
endmodule