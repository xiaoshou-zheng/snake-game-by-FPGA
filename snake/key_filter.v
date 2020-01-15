`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Zheng Jiapei
// Design Name: snake
// Module Name: key_filter
// Description: 按键消抖电路，由六个状态的状态机构成，延迟20ms后输出
// 注意：按下时输入为0；输出为1
//////////////////////////////////////////////////////////////////////////////////


module key_filter(
	input clk,
    input key_in,
    output reg key_out
    );

	reg [2:0] current_state=0;
	reg [2:0] next_state=0;
	
	parameter s0=0;
	parameter s1=1;
	parameter s2=2;
	parameter s3=3;
	parameter s4=4;
	parameter s5=5;

		
	reg en=0;
	reg [18:0] cnt=0;
	reg flag=0;
	
	always@(posedge clk) begin
		current_state<=next_state;
	end
	
	always@(*) begin
		case(current_state)
			s0:begin
				if(key_in==0)
					next_state<=s1;
				else
					next_state<=s0;
				end
			s1:begin
				if(flag==1)
					next_state<=s2;
				else
					next_state<=s1;
				end
			s2:begin
				if(key_in==0)
					next_state<=s3;
				else
					next_state<=s0;
				end
			s3:begin
				if(key_in==1)
					next_state<=s4;
				else
					next_state<=s3;
				end
			s4:begin
				if(flag==1)
					next_state<=s5;
				else
					next_state<=s4;
				end
			s5:begin
				if(key_in==1)
					next_state<=s0;
				else
					next_state<=s3;
				end
			default:
				next_state<=s0;
		endcase
	end
	
	always@(*)begin
		case(current_state)
			s0:begin
				en<=0;
				key_out<=0;
				end
			s1:begin
				en<=1;
				key_out<=0;
				end
			s2:begin
				en<=0;
				key_out<=0;
				end
			s3:begin
				en<=0;
				key_out<=1;
				end
			s4:begin
				en<=1;
				key_out<=1;
				end
			s5:begin
				en<=0;
				key_out<=1;
				end
			default:begin
				en<=0;
				key_out<=0;
				end
		endcase
	end
	
	always@(posedge clk) begin
		if(en==1)begin
			if(cnt!=500000)//计数20ms；500000
				cnt<=cnt+1;
			else begin
				cnt<=0;
				flag<=1;
			end
		end
		else begin
			cnt<=0;
			flag<=0;
			end
	end
		
endmodule
