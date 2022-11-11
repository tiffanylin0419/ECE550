module mux(in1, in2, select, out);

 input in1, in2;
 input select;
 output out;
 
 wire w1, w2, w3; 

 and and_1(w1, in1, select);
 not not_1(w2, select);
 and and_2(w3, w2, in2);

 or or_1(out, w1, w3);

endmodule