module PresentRotr61Fun(
	input wire [79:0] inData,
	output wire [79:0] outData
);

assign outData = {inData[18:0], inData[79:19]};

endmodule 