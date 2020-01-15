`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Zheng Jiapei
// Design Name: snake
// Module Name: score_display
// Description: 两位静态数码管显示电路
//////////////////////////////////////////////////////////////////////////////////


module score_display(
    input [7:0] score,
    output [6:0] gewei,
    output [6:0] shiwei
    );

reg [7:0] bcd=0;
reg [6:0] g;
reg [6:0] s;

assign gewei=~g;
assign shiwei=~s;

always@(*)begin
	case(score)
	7'd00:bcd<=8'h00;
	7'd01:bcd<=8'h01;7'd02:bcd<=8'h02;7'd03:bcd<=8'h03;7'd04:bcd<=8'h04;7'd05:bcd<=8'h05;
	7'd06:bcd<=8'h06;7'd07:bcd<=8'h07;7'd08:bcd<=8'h08;7'd09:bcd<=8'h09;7'd10:bcd<=8'h10;
	7'd11:bcd<=8'h11;7'd12:bcd<=8'h12;7'd13:bcd<=8'h13;7'd14:bcd<=8'h14;7'd15:bcd<=8'h15;
	7'd16:bcd<=8'h16;7'd17:bcd<=8'h17;7'd18:bcd<=8'h18;7'd19:bcd<=8'h19;7'd20:bcd<=8'h20;
	7'd21:bcd<=8'h21;7'd22:bcd<=8'h22;7'd23:bcd<=8'h23;7'd24:bcd<=8'h24;7'd25:bcd<=8'h25;
	7'd26:bcd<=8'h26;7'd27:bcd<=8'h27;7'd28:bcd<=8'h28;7'd29:bcd<=8'h29;7'd30:bcd<=8'h30;
	7'd31:bcd<=8'h31;7'd32:bcd<=8'h32;7'd33:bcd<=8'h33;7'd34:bcd<=8'h34;7'd35:bcd<=8'h35;
	7'd36:bcd<=8'h36;7'd37:bcd<=8'h37;7'd38:bcd<=8'h38;7'd39:bcd<=8'h39;7'd40:bcd<=8'h40;
	7'd41:bcd<=8'h41;7'd42:bcd<=8'h42;7'd43:bcd<=8'h43;7'd44:bcd<=8'h44;7'd45:bcd<=8'h45;
	7'd46:bcd<=8'h46;7'd47:bcd<=8'h47;7'd48:bcd<=8'h48;7'd49:bcd<=8'h49;7'd50:bcd<=8'h50;
	7'd51:bcd<=8'h51;7'd52:bcd<=8'h52;7'd53:bcd<=8'h53;7'd54:bcd<=8'h54;7'd55:bcd<=8'h55;
	7'd56:bcd<=8'h56;7'd57:bcd<=8'h57;7'd58:bcd<=8'h58;7'd59:bcd<=8'h59;7'd60:bcd<=8'h60;
	7'd61:bcd<=8'h61;7'd62:bcd<=8'h62;7'd63:bcd<=8'h63;7'd64:bcd<=8'h64;7'd65:bcd<=8'h65;
	7'd66:bcd<=8'h66;7'd67:bcd<=8'h67;7'd68:bcd<=8'h68;7'd69:bcd<=8'h69;7'd70:bcd<=8'h70;
	7'd71:bcd<=8'h71;7'd72:bcd<=8'h72;7'd73:bcd<=8'h73;7'd74:bcd<=8'h74;7'd75:bcd<=8'h75;
	7'd76:bcd<=8'h76;7'd77:bcd<=8'h77;7'd78:bcd<=8'h78;7'd79:bcd<=8'h79;7'd80:bcd<=8'h80;
	7'd81:bcd<=8'h81;7'd82:bcd<=8'h82;7'd83:bcd<=8'h83;7'd84:bcd<=8'h84;7'd85:bcd<=8'h85;
	7'd86:bcd<=8'h86;7'd87:bcd<=8'h87;7'd88:bcd<=8'h88;7'd89:bcd<=8'h89;7'd90:bcd<=8'h90;
	7'd91:bcd<=8'h91;7'd92:bcd<=8'h92;7'd93:bcd<=8'h93;7'd94:bcd<=8'h94;7'd95:bcd<=8'h95;
	7'd96:bcd<=8'h96;7'd97:bcd<=8'h97;7'd98:bcd<=8'h98;7'd99:bcd<=8'h99;
	default:bcd<=8'h99;
	endcase
end

always@(*)begin
case (bcd[3:0] )
	4'b0000: g = 7'b0111111; // 0
	4'b0001: g = 7'b0000110; // 1
	4'b0010: g = 7'b1011011; // 2
	4'b0011: g = 7'b1001111; // 3
	4'b0100: g = 7'b1100110; // 4
	4'b0101: g = 7'b1101101; // 5
	4'b0110: g = 7'b1111101; // 6
	4'b0111: g = 7'b0000111; // 7
	4'b1000: g = 7'b1111111; // 8
	4'b1001: g = 7'b1101111; // 9
	default: g = 7'b0000000;
endcase
end

always@(*)begin
case (bcd[7:4] )
	4'b0000: s = 7'b0111111; // 0
	4'b0001: s = 7'b0000110; // 1
	4'b0010: s = 7'b1011011; // 2
	4'b0011: s = 7'b1001111; // 3
	4'b0100: s = 7'b1100110; // 4
	4'b0101: s = 7'b1101101; // 5
	4'b0110: s = 7'b1111101; // 6
	4'b0111: s = 7'b0000111; // 7
	4'b1000: s = 7'b1111111; // 8
	4'b1001: s = 7'b1101111; // 9
	default: s = 7'b0000000;
endcase
end
	
endmodule
