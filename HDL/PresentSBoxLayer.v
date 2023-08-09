module PresentSBoxLayer (
	input wire [63:0] inData,
	output wire [63:0] outData
);

wire [3:0] outPresentSBoxFun1;
wire [3:0] outPresentSBoxFun2;
wire [3:0] outPresentSBoxFun3;
wire [3:0] outPresentSBoxFun4;
wire [3:0] outPresentSBoxFun5;
wire [3:0] outPresentSBoxFun6;
wire [3:0] outPresentSBoxFun7;
wire [3:0] outPresentSBoxFun8;
wire [3:0] outPresentSBoxFun9;
wire [3:0] outPresentSBoxFun10;
wire [3:0] outPresentSBoxFun11;
wire [3:0] outPresentSBoxFun12;
wire [3:0] outPresentSBoxFun13;
wire [3:0] outPresentSBoxFun14;
wire [3:0] outPresentSBoxFun15;
wire [3:0] outPresentSBoxFun16;

PresentSBoxFun InstPresentSBoxFun1(
	.inData(inData[63:60]),
	.outData(outPresentSBoxFun1)
);

PresentSBoxFun InstPresentSBoxFun2(
	.inData(inData[59: 56]),
	.outData(outPresentSBoxFun2)
);

PresentSBoxFun InstPresentSBoxFun3(
	.inData(inData[55:52]),
	.outData(outPresentSBoxFun3)
);

PresentSBoxFun InstPresentSBoxFun4(
	.inData(inData[51:48]),
	.outData(outPresentSBoxFun4)
);

PresentSBoxFun InstPresentSBoxFun5(
	.inData(inData[47:44]),
	.outData(outPresentSBoxFun5)
);

PresentSBoxFun InstPresentSBoxFun6(
	.inData(inData[43:40]),
	.outData(outPresentSBoxFun6)
);

PresentSBoxFun InstPresentSBoxFun7(
	.inData(inData[39:36]),
	.outData(outPresentSBoxFun7)
);

PresentSBoxFun InstPresentSBoxFun8(
	.inData(inData[35:32]),
	.outData(outPresentSBoxFun8)
);

PresentSBoxFun InstPresentSBoxFun9(
	.inData(inData[31:28]),
	.outData(outPresentSBoxFun9)
);

PresentSBoxFun InstPresentSBoxFun10(
	.inData(inData[27:24]),
	.outData(outPresentSBoxFun10)
);

PresentSBoxFun InstPresentSBoxFun11(
	.inData(inData[23:20]),
	.outData(outPresentSBoxFun11)
);

PresentSBoxFun InstPresentSBoxFun12(
	.inData(inData[19:16]),
	.outData(outPresentSBoxFun12)
);

PresentSBoxFun InstPresentSBoxFun13(
	.inData(inData[15:12]),
	.outData(outPresentSBoxFun13)
);

PresentSBoxFun InstPresentSBoxFun14(
	.inData(inData[11:8]),
	.outData(outPresentSBoxFun14)
);

PresentSBoxFun InstPresentSBoxFun15(
	.inData(inData[7:4]),
	.outData(outPresentSBoxFun15)
);

PresentSBoxFun InstPresentSBoxFun16(
	.inData(inData[3:0]),
	.outData(outPresentSBoxFun16)
);

assign outData = {outPresentSBoxFun1, outPresentSBoxFun2, outPresentSBoxFun3, outPresentSBoxFun4, outPresentSBoxFun5, outPresentSBoxFun6, outPresentSBoxFun7, outPresentSBoxFun8, outPresentSBoxFun9, outPresentSBoxFun10, outPresentSBoxFun11, outPresentSBoxFun12, outPresentSBoxFun13, outPresentSBoxFun14, outPresentSBoxFun15, outPresentSBoxFun16};

endmodule
