module PresentKeyFun(
	input wire [79:0] inData,
	input wire [4:0]  inRoundCounter,
	output wire [79:0] outData
);

wire [79:0] outRotr64Wire;
wire [3:0] outSBoxWire;
wire [4:0] addCounterOutWire;

PresentRotr61Fun PresentRotr61FunInst(
	.inData(inData),
	.outData(outRotr64Wire)
);

PresentSBoxFun PresentSBoxFunInst(
	.inData(outRotr64Wire[79:76]),
	.outData(outSBoxWire)
);


assign addCounterOutWire = outRotr64Wire[19:15] ^ inRoundCounter;

assign outData = {outSBoxWire, outRotr64Wire[75:20], addCounterOutWire, outRotr64Wire[14:0]};

endmodule 