module mux_5(in1, in2, select, out);

 input [4:0] in1, in2;
 input select;
 output [4:0] out;

 mux m0(in1[0], in2[0], select, out[0]);
 mux m1(in1[1], in2[1], select, out[1]);
 mux m2(in1[2], in2[2], select, out[2]);
 mux m3(in1[3], in2[3], select, out[3]); 
 mux m4(in1[4], in2[4], select, out[4]);

endmodule