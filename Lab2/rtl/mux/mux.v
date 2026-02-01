//-----------------------------------------------------
// Design Name : mux
// File Name   : mux.v
// Function    : 2:1 
//-----------------------------------------------------
module  mux (
c      , // Mux output
a      , // Mux First input
b        , // Mux Second input
s      // Select input
);
//-----------Input Ports---------------
input a, b, s ;
//-----------Output Ports---------------
output c;
//------------Internal Variables--------
reg  c;
//-------------Code Starts Here---------
always @ (s or a or b)
begin : MUX
  if (s == 1'b0) begin
      c = a;
  end else begin
      c = b ;
  end
end

endmodule //End Of Module mux
