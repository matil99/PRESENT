module TbPresentControl;

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

reg 		inKeyExtWr = 1'b0;
reg			inExtDataWr = 1'b0;
wire		outStateExtWr;
wire		outStateIntWr;
wire		outKeyExtWr;
wire		outKeyIntWr;
wire		outDataIntWr;
wire[4:0]	outRoundCounter;
wire		outBusy;





PresentControl PresentControlInst(
	.inClk(inClk),
	.inKeyExtWr(inKeyExtWr),
	.inExtDataWr(inExtDataWr),
	.outStateExtWr(outStateExtWr),
	.outStateIntWr(outStateIntWr),
	.outKeyExtWr(outKeyExtWr),
	.outKeyIntWr(outKeyIntWr),
	.outDataIntWr(outDataIntWr),
	.outRoundCounter(outRoundCounter),
	.outBusy(outBusy)
);

always
begin
	TEST = TEST + 1;
	inKeyExtWr <= 1'b1;
	inExtDataWr <= 1'd1;
	if (TEST == 33) begin 
		$stop;
	end
	#(inClkp);
end

endmodule