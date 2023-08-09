module TbPresentRoundKey;

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

reg		[79:0] inData = 80'b0;
reg		[4:0] inRoundCounter = 5'b0;
wire	[79:0] outData;





PresentKeyFun PresentKeyFun(
	.inData(inData),
	.inRoundCounter(inRoundCounter),
	.outData(outData)
);

always
begin
	TEST = TEST + 1;
	inData <= 80'b0;
	inRoundCounter <= 5'd1;
	#(inClkp);
	$display("Klucz (koncowy) 2: %b", outData[79:16]);
	#(inClkp);
	inData <= outData;
	inRoundCounter <= 5'd2;
	#(inClkp);
	$display("Klucz (koncowy) 3: %b", outData[79:16]);
	#(inClkp);
	inData <= outData;
	inRoundCounter <= 5'd3;
	#(inClkp);
	$display("Klucz (koncowy) 4: %b", outData[79:16]);
    $stop;
end

endmodule