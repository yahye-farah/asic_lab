
module TrafficLightControl (
    input CLK,       // 100MHz clock
    input RST,
    output reg RNS, YNS, GNS,
    output reg REW, YEW, GEW
);

    // 100MHz = 100,000,000 cycles per second.
    // For a 5-second interval: 5 * 100,000,000 = 500,000,000.
    // 29-bit register to hold 500 million (2^29 = 536,870,912).
    parameter SEC_5 = 500_000_000;

    reg [28:0] timer;
    reg [3:0]  count_idx;

    // 5-second pulse Timer
    always @(posedge CLK or posedge RST) begin
        if (RST) begin
            timer <= 29'd0;
            count_idx <= 4'd0;
        end else begin
            if (timer == SEC_5 - 1) begin
                timer <= 29'd0;
                count_idx <= count_idx + 1; // Incrementing state every 5 seconds
            end else begin
                timer <= timer + 1;
            end
        end
    end

   


    always @(*) begin
        {RNS, YNS, GNS, REW, YEW, GEW} = 6'b000000;
        
        case (count_idx)
            4'd0, 4'd1, 4'd2, 4'd3, 4'd4, 4'd5: begin // Green NS
                GNS = 1; REW = 1;
            end
            4'd6: begin // Yellow NS
                YNS = 1; REW = 1;
            end
            4'd7: begin // All Red
                RNS = 1; REW = 1;
            end
            4'd8, 4'd9, 4'd10, 4'd11, 4'd12, 4'd13: begin // Green EW
                RNS = 1; GEW = 1;
            end
            4'd14: begin // Yellow EW
                RNS = 1; YEW = 1;
            end
            4'd15: begin // All Red
                RNS = 1; REW = 1;
            end
        endcase
    end

endmodule

