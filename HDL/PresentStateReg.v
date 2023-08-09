module PresentStateReg(
	input wire 			inClk,
	input wire 			inExtWr,
	input wire [63:0] inExtData,
	input wire			inIntWr,
	input wire [63:0] inIntData,
	output wire [63:0] outDataInt,
	output wire [63:0] outDataExt
);

reg [63:0] regData = 63'b0;

always @(posedge(inClk))
begin
	if (inExtWr == 1'b1) begin
		regData <= inExtData;
	end
	if (inIntWr == 1'b1) begin
		regData <= inIntData;
	end	
end

assign outDataInt = regData;
assign outDataExt = regData;

endmodule 