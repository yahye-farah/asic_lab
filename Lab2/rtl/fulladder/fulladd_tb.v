`include "../rtl/fulladder/global.v"

module fulladd_tb();
    reg a, b, c;
    reg [7:0] expected_sum;
    reg [7:0] expected_carry;
    wire fsum, fcarry;
    reg [31:0] result;
    integer  i;


    //fsum, fcarry, a, b, c
    full_adder fa(.fsum(fsum), .fcarry(fcarry), .a(a), .b(b), .c(c));

    initial begin
        expected_sum =   8'b01101001;
        expected_carry = 8'b00010111;
    end

    initial begin
        $display("A B C | Fsum Fcarry Test_Result");

        for (i = 0 ; i < 8 ; i = i + 1 ) begin
            {a, b, c} = i[2:0];
            // #10;
            #`DELAY;
            
            result = (fsum == expected_sum[7-i] && fcarry == expected_carry[7-i]) ? "PASS" : "FAIL";

            $display("%b %b %b | %b    %b       %s", a, b, c, fsum, fcarry, result);
        end
        $finish;
    end

endmodule