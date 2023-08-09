module TbPresentNextStateFun;

/////////////////////////////////////////

reg [63:0] TEST = 0;

/////////////////////////////////////////

parameter   inClkp = 10;
reg         inClk  = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

/////////////////////////////////////////

reg 	[63:0] 	inKey = 64'b0;
reg 	[63:0] 	inData = 64'b0;
wire 	[63:0]	outData1;
wire 	[63:0]	outData2;



PresentNextStateFun PresentNextStateFunInst(
	.inData(inData),
	.inKey(inKey),
	.outDataExt(outData1),
	.outDataInt(outData2)
);

always
begin
	inKey<= 64'b0;
	inData <= 64'b0;
	#(inClkp);
	$display("Stan: %d: %b",TEST, outData1);
	TEST = TEST + 1;
	inKey <= 64'b1100000000000000000000000000000000000000000000000000000000000000;
	inData <= 64'b1111111111111111111111111111111100000000000000000000000000000000;
	#(inClkp);
	$display("Stan: %d: %b",TEST, outData1);
	TEST = TEST + 1;
	inKey <= 64'b0101000000000000000110000000000000000000000000000000000000000001;
	inData <= 64'b1000000011111111000000001111111111111111000000001000000000000000;
	#(inClkp);
	$display("Stan: %d: %b",TEST, outData1);
	$stop;
end

endmodule