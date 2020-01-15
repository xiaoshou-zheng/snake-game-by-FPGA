`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Zheng Jiapei
// Design Name: snake
// Module Name: top
// Description: 顶层模块
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
	input clk,
	input u,
	input d,
	input l,
	input r,
	input rst,
	input start,
	output [15:0] row,
	output [15:0] col,
	output [6:0] gewei,
	output [6:0] shiwei	
    );

wire up;
wire down;
wire left;
wire right;
wire RST;
wire START;
wire clk_5;
wire clk_800;
wire [7:0]score;

//按键消抖模组
key_filter k0(
	.clk(clk),
    .key_in(u),
    .key_out(up)
    );
key_filter k1(
	.clk(clk),
    .key_in(d),
    .key_out(down)
    );
key_filter k2(
	.clk(clk),
    .key_in(l),
    .key_out(left)
    );
key_filter k3(
	.clk(clk),
    .key_in(r),
    .key_out(right)
    );
key_filter k4(
	.clk(clk),
    .key_in(rst),
    .key_out(RST)
    );
key_filter k5(
	.clk(clk),
    .key_in(start),
    .key_out(START)
    );

//分频模块
clk_gen clk_gen0(
    .clk(clk),
    .clk_5(clk_5),
    .clk_800(clk_800)
    );

//
snake snake0(
    .clk(clk),
    .clk_5(clk_5),
    .clk_800(clk_800),
    .up(up),
    .down(down),
    .left(left),
    .right(right),
    .START(START),
    .RST(RST),
    .score(score),
	.display_x(row),
	.display_y(col)
    );

//分数显示
score_display display0(
    .score(score),
    .gewei(gewei),
    .shiwei(shiwei)
    );


endmodule
