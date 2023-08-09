/*
Moduł implementujący pojedyńczego sBoxa 
*/
module PresentSBoxFun (
	input wire [3:0] inData,
	output wire [3:0] outData
);

assign outData = (inData == 4'd0) ? 4'hc:
						(inData == 4'd1) ? 4'h5:
						(inData == 4'd2) ? 4'h6:
						(inData == 4'd3) ? 4'hb:
						(inData == 4'd4) ? 4'h9:
						(inData == 4'd5) ? 4'h0:
						(inData == 4'd6) ? 4'ha:
						(inData == 4'd7) ? 4'hd:
						(inData == 4'd8) ? 4'h3:
						(inData == 4'd9) ? 4'he:
						(inData == 4'd10) ? 4'hf:
						(inData == 4'd11) ? 4'h8:
						(inData == 4'd12) ? 4'h4:
						(inData == 4'd13) ? 4'h7:
						(inData == 4'd14) ? 4'h1: 4'h2;
endmodule 