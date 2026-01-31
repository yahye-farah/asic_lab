/*****************************************************************************************************
* Description:                 74HC138 test bench
*
* Author:                      Dengxue Yan
*
* Email:                       Dengxue.Yan@wustl.edu
*
* Rev History:
*       <Author>        <Date>        <Hardware>     <Version>        <Description>
*     Dengxue Yan   2016-08-27 17:00       --           1.00             Create
*****************************************************************************************************/
`timescale 100ps / 1ps

module C74HC138_tb;
    reg CLK;

    reg A; 
    reg B; 
    reg C; 

    reg E1;
    reg E2;
    reg E3;

    wire Y0;
    wire Y1;
    wire Y2;
    wire Y3;
    wire Y4;
    wire Y5;
    wire Y6;
    wire Y7;

    C74HC138 DUT(
        .A(A), 
        .B(B), 
        .C(C), 
        .E1(E1),
        .E2(E2), 
        .E3(E3),
        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .Y6(Y6),
        .Y7(Y7)
    );

    initial
    begin

        $dumpfile("C74HC138.vcd"); 
        $dumpvars(0, C74HC138_tb); 

        CLK= 0;
        A  = 0;
        B  = 0;
        C  = 0;
        E1 = 0;
        E2 = 1;
        E3 = 1;

        #10
        A  = 0;
        B  = 1;
        C  = 1;
        E1 = 1;
        E2 = 1;
        E3 = 1;

        #10
        A  = 0;
        B  = 1;
        C  = 0;
        E1 = 0;
        E2 = 0;
        E3 = 1;

        #10
        A  = 0;
        B  = 1;
        C  = 0;
        E1 = 1;
        E2 = 0;
        E3 = 1;

        #10
        A  = 0;
        B  = 1; // reset
        C  = 0;
        E1 = 0;
        E2 = 1;
        E3 = 0;

        #10
        A  = 0;
        B  = 1; // reset
        C  = 0;
        E1 = 1;
        E2 = 1;
        E3 = 0;

        #10
        A  = 0;
        B  = 1; // reset
        C  = 0;
        E1 = 0;
        E2 = 0;
        E3 = 0;

        #10
        A  = 0;
        B  = 0; // reset
        C  = 0;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 1;
        B  = 0; // reset
        C  = 0;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 0;
        B  = 1; // reset
        C  = 0;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 1;
        B  = 1; // reset
        C  = 0;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 0;
        B  = 0; // reset
        C  = 1;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 1;
        B  = 0; // reset
        C  = 1;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 0;
        B  = 1; // reset
        C  = 1;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 1;
        B  = 1; // reset
        C  = 1;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 0;
        B  = 0; // reset
        C  = 0;
        E1 = 1;
        E2 = 0;
        E3 = 0;

        #10
        A  = 0;
        B  = 0; // reset
        C  = 0;
        E1 = 0;
        E2 = 0;
        E3 = 0;

        #10
        $finish;

    end
    always
        #10 CLK= !CLK;
endmodule
