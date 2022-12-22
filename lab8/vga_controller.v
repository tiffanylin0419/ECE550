module vga_controller(iRST_n,
                      iVGA_CLK,
                      oBLANK_n,
                      oHS,
                      oVS,
                      b_data,
                      g_data,
                      r_data,
							 up,down,left,right);

input up,down,left,right;	
input iRST_n;
input iVGA_CLK;
output reg oBLANK_n;
output reg oHS;
output reg oVS;
output [7:0] b_data;
output [7:0] g_data;  
output [7:0] r_data;                        
///////// ////                     
reg [18:0] ADDR;
reg [23:0] bgr_data;
wire VGA_CLK_n;
wire [7:0] index;
wire [23:0] bgr_data_raw;
wire cBLANK_n,cHS,cVS,rst;
////
assign rst = ~iRST_n;
video_sync_generator LTM_ins (.vga_clk(iVGA_CLK),
                              .reset(rst),
                              .blank_n(cBLANK_n),
                              .HS(cHS),
                              .VS(cVS));
////
////Addresss generator
reg [10:0]x,y;
always@(posedge iVGA_CLK,negedge iRST_n)
begin
  if (!iRST_n)
     ADDR<=19'd0;
  else if (cHS==1'b0 && cVS==1'b0)
     ADDR<=19'd0;
  else if (cBLANK_n==1'b1) begin
     ADDR<=ADDR+1;end
	x<=ADDR%640;
	y<=ADDR/640;
end
//////////////////////////
//////INDEX addr.
assign VGA_CLK_n = ~iVGA_CLK;
img_data	img_data_inst (
	.address ( ADDR ),
	.clock ( VGA_CLK_n ),
	.q ( index )
	);
	
/////////////////////////
//////Add switch-input logic here
	
//////Color table output
img_index	img_index_inst (
	.address ( index ),
	.clock ( iVGA_CLK ),
	.q ( bgr_data_raw)
	);	
//////
//////latch valid data at falling edge;

always@(posedge VGA_CLK_n)begin
	if(x_pos<=x&&x<x_pos+20 && y_pos<=y&&y<y_pos+20) bgr_data <= 24'h0000FF;
	else bgr_data <= bgr_data_raw;
end

reg [10:0]x_pos,y_pos;
reg [20:0]count;

initial 
begin
x_pos=0;
y_pos=0;
count=0;
end
always@(posedge VGA_CLK_n)begin
	if(count%80000==0)begin
		if(x_pos<620&&right)x_pos<=x_pos+1;
		if(x_pos>1&&left)x_pos<=x_pos-1;
		if(y_pos<460&&down)y_pos<=y_pos+1;
		if(y_pos>1&&up)y_pos<=y_pos-1;
		
		
	end	
	
	
	count<=count+1;
end

assign b_data = bgr_data[23:16];
assign g_data = bgr_data[15:8];
assign r_data = bgr_data[7:0]; 

///////////////////
//////Delay the iHD, iVD,iDEN for one clock cycle;
always@(negedge iVGA_CLK)
begin
  oHS<=cHS;
  oVS<=cVS;
  oBLANK_n<=cBLANK_n;
end

endmodule
 	















