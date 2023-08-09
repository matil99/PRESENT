module PresentEnc(
	input wire 				inClk,
	input wire				inKeyWr,
	input wire 	[79:0] 	inKeyData,
	input wire				inDataWr,
	input wire 	[63:0] 	inData,
	output wire [63:0]	outData,
	output wire 			outBusy
);


wire outControlStateExtWr;
wire outControlStateIntWr;
wire outControlKeyExtWr;
wire outControlKeyIntWr;
wire outControlOutDataWr;
wire [4:0] outControlRoundCounter;

PresentControl PresentControl(
	.inClk(inClk),
	.inKeyExtWr(inKeyWr),
	.inExtDataWr(inDataWr),
	.outStateExtWr(outControlStateExtWr),
	.outStateIntWr(outControlStateIntWr),
	.outKeyExtWr(outControlKeyExtWr),
	.outKeyIntWr(outControlKeyIntWr),
	.outDataIntWr(outControlOutDataWr),
	.outRoundCounter(outControlRoundCounter),
	.outBusy(outBusy)
);

wire [63:0] inStateRegIntData;
wire [63:0] outStateRegData;
wire [63:0] outStateRegExt;

PresentStateReg PresentStateReg(
	.inClk(inClk),
	.inExtWr(outControlStateExtWr),
	.inExtData(inData),
	.inIntWr(outControlStateIntWr),
	.inIntData(inStateRegIntData),
	.outDataInt(outStateRegData),
	.outDataExt(outStateRegExt)
);

wire [63:0] inNextStateFunKey;

PresentNextStateFun PresentNextStateFun(
	.inData(outStateRegData),
	.inKey(inNextStateFunKey),
	.outDataInt(inStateRegIntData)
);

wire [79:0] inKeyRegIntData;
wire [79:0] outKeyRegIntData;
wire [63:0] outKeyRegLastKey;

PresentKeyReg PresentKeyReg(
	.inClk(inClk),
	.inKeyExtWr(outControlKeyExtWr),
	.inKeyExtData(inKeyData),
	.inKeyIntWr(outControlKeyIntWr),
	.inKeyIntData(inKeyRegIntData),
	.outData(outKeyRegIntData),
	.outRoundKey(inNextStateFunKey),
	.outLastKey(outKeyRegLastKey)
);

PresentKeyFun PresentKeyFun(
	.inData(outKeyRegIntData),
	.inRoundCounter(outControlRoundCounter),
	.outData(inKeyRegIntData)
);

PresentDataOutReg PresentDataOutReg(
	.inClk(inClk),
	.inDataWr(outControlOutDataWr),
	.inData(outStateRegExt),
	.inKey(outKeyRegLastKey),
	.outData(outData)
);

endmodule 