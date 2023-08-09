module PresentControl(
	input wire			inClk,
	input wire 			inKeyExtWr,
	input wire			inExtDataWr,
	output wire			outStateExtWr,
	output wire			outStateIntWr,
	output wire			outKeyExtWr,
	output wire			outKeyIntWr,
	output wire			outDataIntWr,
	output wire	[4:0]	outRoundCounter,
	output wire			outBusy
);

reg [5:0] regCounter = 5'd0;

always @(posedge(inClk))
begin
	if ((inExtDataWr == 1'b1) || (regCounter != 6'b0)) begin
		if ( regCounter != 6'd32 ) begin
			regCounter <= regCounter + 6'd1;
		end else begin
			regCounter <= 6'd0;
		end
	end
end

assign outStateExtWr = (regCounter == 6'd0) && (inExtDataWr == 1'b1) ? 1'b1 : 1'b0;

assign outStateIntWr = (regCounter != 6'd0) && (regCounter != 6'd32) ? 1'b1 : 1'b0;

assign outKeyExtWr = (regCounter == 6'd0) && (inKeyExtWr == 1'b1) ? 1'b1 : 1'b0;

assign outKeyIntWr = (regCounter != 6'd0) ? 1'b1 : 1'b0;

assign outDataIntWr = (regCounter == 6'd32) ? 1'b1 : 1'b0;

assign outRoundCounter = regCounter[4:0];

assign outBusy = (regCounter != 32'd0) ? 1'b1 : 1'b0;

endmodule 