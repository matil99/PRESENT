module PresentNextStateFun(
	input wire [63:0] inData,
	input wire [63:0] inKey,
	output wire [63:0] outDataInt
);

wire [63:0] outAddKey;
wire [63:0] outSBoxLayer;
wire [63:0] outpLayer;


assign outAddKey = inData ^ inKey;

PresentSBoxLayer PresentSBoxLayerInst(
	.inData(outAddKey),
	.outData(outSBoxLayer)
);

PresentpLayer PresentpLayerInst(
	.inData(outSBoxLayer),
	.outData(outpLayer)
);


assign outDataInt = outpLayer;

endmodule 

