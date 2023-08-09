module PresentDataOutReg(
	input wire 			inClk,
	input wire 			inDataWr,
	input wire [63:0] inData,
	input wire [63:0] inKey,
	output wire [63:0] outData	
);

reg [63:0] regOut = 63'b0;

always @(posedge(inClk))
begin
	if (inDataWr == 1'b1) begin
		regOut <= inData ^ inKey;
	end
end

assign outData = regOut;

endmodule 