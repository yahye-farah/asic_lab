/*****************************************************************************************************
* Description:                 Traffic Light Control test bench
*
* Author:                      Dengxue Yan
*
* Email:                       Dengxue.Yan@wustl.edu
*
* Rev History:
*       <Author>        <Date>        <Hardware>     <Version>        <Description>
*     Dengxue Yan   2016-08-27 17:00       --           1.00             Create
*****************************************************************************************************/
`timescale 100ms / 1ns

module TrafficLightControl_tb;
    reg RST;
    reg CLK;

    wire RNS;
    wire YNS;
    wire GNS;
    wire REW;
    wire YEW;
    wire GEW;

    TrafficLightControl DUT(
        .RST(RST),
        .CLK(CLK),
        .RNS(RNS),
        .YNS(YNS),
        .GNS(GNS),
        .REW(REW),
        .YEW(YEW),
        .GEW(GEW)
    );
//
    initial
    begin

        $dumpfile("TrafficLightControl.vcd"); 
        $dumpvars(0, TrafficLightControl_tb); 

        CLK = 0;
        RST = 1;

        #1

        #50
        RST = 0;

        #1600
        $finish;

    end
    always
        #25 CLK= !CLK;
endmodule

