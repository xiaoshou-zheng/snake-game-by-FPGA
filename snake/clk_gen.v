`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////: 
// Engineer: Zheng Jiapei
// Design Name: snake
// Module Name: clk_gen
// Description: 进行时钟分频，5hz用于移动，800hz用于扫描
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_gen(
    input clk,
    //input s0,
    //input s1,
    output reg clk_5,
    output reg clk_800
    );
reg [13:0] cnt1=0;
reg [22:0] cnt2=0;

always@(posedge clk)begin
	if(cnt1==14'b11_1111_1111_1111)begin
		cnt1<=0;
		clk_800<=1;
		end
	else begin
		cnt1<=cnt1+1;
		clk_800<=0;
	end
end

always@(posedge clk)begin
	if(cnt2==23'b111_1111_1111_1111_1111_1111)begin
		cnt2<=0;
		clk_5<=1;
		end
	else begin
		cnt2<=cnt2+1;
		clk_5<=0;
	end
end
endmodule
