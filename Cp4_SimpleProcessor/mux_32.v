module mux_32(in1, in2, select, out);

 input [31:0] in1, in2;
 input select;
 output [31:0] out;

 genvar j;
 generate
  for (j = 0; j<= 31; j = j + 1) begin:hi1
   mux muxi(in1[j],in2[j],select, out[j]);
  end
 endgenerate
 

endmodule