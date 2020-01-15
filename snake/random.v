`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Zheng Jiapei
// Design Name: snake
// Module Name: random
// Description: 一个“随机”数发生器，用于苹果的生成
// 
//////////////////////////////////////////////////////////////////////////////////


module random(
	input clock,
	input [13:0]max_number,
	input [13:0]min_number,
	input [2:0] step,
	output reg [15:0]num_out
    );

reg [13:0]counter=0;
wire [3:0] out;

assign out = counter;

always@(posedge clock)
begin
    if(counter == max_number)
    begin
        counter <= min_number;
    end
    else
    begin
        counter <= counter +step;
    end
end

always@(*)begin
	case(out)
		4'b0000:num_out = 16'b0000_0000_0000_0001;
		4'b0001:num_out = 16'b0000_0000_0000_0010;
		4'b0010:num_out = 16'b0000_0000_0000_0100;
		4'b0011:num_out = 16'b0000_0000_0000_1000;
		
		4'b0100:num_out = 16'b0000_0000_0001_0000;
		4'b0101:num_out = 16'b0000_0000_0010_0000;
		4'b0110:num_out = 16'b0000_0000_0100_0000;
		4'b0111:num_out = 16'b0000_0000_1000_0000;
		
		4'b1000:num_out = 16'b0000_0001_0000_0000;
		4'b1001:num_out = 16'b0000_0010_0000_0000;
		4'b1010:num_out = 16'b0000_0100_0000_0000;
		4'b1011:num_out = 16'b0000_1000_0000_0000;
		
		4'b1100:num_out = 16'b0001_0000_0000_0000;
		4'b1101:num_out = 16'b0010_0000_0000_0000;
		4'b1110:num_out = 16'b0100_0000_0000_0000;
		4'b1111:num_out = 16'b1000_0000_0000_0000;
		default:num_out = 16'b0000_0000_0000_0000;
	endcase
	end
endmodule

