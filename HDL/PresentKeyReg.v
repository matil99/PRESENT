module PresentKeyReg(
	input wire 			inClk,
	input wire			inKeyExtWr,
	input wire [79:0] inKeyExtData,
	input wire			inKeyIntWr,
	input wire [79:0] inKeyIntData,
	output wire [79:0] outData,
	output wire [63:0] outRoundKey,
	output wire [63:0] outLastKey
);

reg [79:0] regKey = 80'b0;

always @(posedge(inClk))
begin
	if (inKeyExtWr == 1'b1) begin
		regKey <= inKeyExtData;
	end
	if (inKeyIntWr == 1'b1) begin
		regKey <= inKeyIntData;
	end
end

assign outData = regKey;
assign outRoundKey = regKey[79:16];
assign outLastKey = regKey[79:16];

endmodule 