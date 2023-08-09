module TbPresentEnc;

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

reg				inKeyWr = 1'b0;
reg 	[79:0] 	inKeyData = 80'b0;
reg				inDataWr = 1'b0;
reg 	[63:0] 	inData = 64'b0;
wire 	[63:0]	outData;
wire 			outBusy;


reg [79:0] tempKey = 80'b0;
reg [63:0] tempData = 64'b0;


PresentEnc EncInst(
	.inClk(inClk),
	.inKeyWr(inKeyWr),
	.inKeyData(inKeyData),
	.inDataWr(inDataWr),
	.inData(inData),
	.outData(outData),
	.outBusy(outBusy)
);

always
begin
	TEST = TEST + 1;
	inKeyWr <= 1'b1; inKeyData <= tempKey;
	inDataWr <= 1'b1; inData <= tempData;
	#(inClkp);
	inKeyWr <= 1'b0; inKeyData <= 80'b0;
	inDataWr <= 1'b0; inData <= 64'b0;
	wait (outBusy == 1'b0 && inClk == 1'b1);
		if (TEST == 64'd1) begin
			if (outData != 64'b0101010101111001110000010011100001111011001000101000010001000101) begin
				$display("Niepoprawne pierwsze szyfrowanie");
				$stop;
			end
		end
		$display("Szyfrogram %d: %b", TEST, outData);
		tempKey <= tempKey ^ TEST;
		tempData <= outData;
		
		if (TEST == 64'd11) begin
			$stop;
		end
end


endmodule