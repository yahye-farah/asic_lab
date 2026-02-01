module full_adder(fsum, fcarry, a, b, c);
	input a, b, c;
	output fsum, fcarry;
	wire half_sum1, half_carry1, half_carry2;

half_adder HA1(half_sum1, half_carry1, a, b);
half_adder HA2(fsum, half_carry2, half_sum1, c);
or OR1(fcarry, half_carry1, half_carry2);

endmodule


module half_adder(sum, carry, a, b);
	input a, b;
    output sum, carry;
xor sum1(sum, a, b); // same as saying sum = a ^ b
and carry1(carry, a, b); // same as saying carry = a & b
endmodule






