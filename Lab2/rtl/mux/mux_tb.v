// Example Testbench: mux_tb.v
//
module mux_tb();

wire c; 
reg a,b,s;
mux m1(c, a, b, s) ; 

initial begin
#0 a=1'b0;
b=1'b0; s=1'b0;
#5 a=1'b1;
#5 s=1'b1;
#5 $finish; // The $finish call ends simulation.
end
initial $monitor($time," a=%b \t b=%b\t s=%b\t c=%b ",a,b,s,c);

endmodule
