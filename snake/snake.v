`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Zheng Jiapei
// Design Name: snke
// Module Name: snake
// Description: 贪锟斤拷锟竭碉拷锟斤拷模锟介，
// 
//////////////////////////////////////////////////////////////////////////////////


module snake(
    input clk,
    input clk_5,
    input clk_800,
    input up,
    input down,
    input left,
    input right,
    input START,
    input RST,
    output reg [7:0] score=0,
	output wire [15:0] display_x,
	output wire [15:0] display_y
    );

reg DIE=0;

reg d_up=0;
reg d_down=0;
reg d_left=0;
reg d_right=0;

wire [7:0] size;

reg [15:0] x [99:0];		//16位锟斤拷锟斤拷位锟斤拷锟斤拷
reg [15:0] y [99:0];		//16位锟斤拷锟斤拷位锟斤拷锟斤拷
reg [15:0] xx [99:0];		//16位锟斤拷锟斤拷位锟斤拷锟斤拷
reg [15:0] yy [99:0];        //16位锟斤拷锟斤拷位锟斤拷锟斤拷

reg [15:0] apple_x;
reg [15:0] apple_y;

//d锟斤拷锟斤拷锟斤拷模锟介，锟斤拷锟斤拷锟斤拷锟酵的帮拷锟斤拷锟斤拷锟斤拷锟脚猴拷一直锟斤拷锟街碉拷锟斤拷一锟斤拷锟脚号碉拷锟斤拷锟斤拷
//锟斤拷为锟斤拷只要锟斤拷锟铰凤拷锟斤拷锟斤拷锟斤拷锟竭就伙拷一直锟斤拷锟角憋拷锟斤拷
always@(posedge clk)begin
	if(RST==1|| DIE==1)begin
		d_up=0; d_down=0; d_left=0; d_right=0;
		end
	else if(START==1)begin	//默锟斤拷锟斤拷锟斤拷锟斤拷锟剿讹拷
		d_up=0; d_down=0; d_left=0; d_right=1;
		end
	else if (up==1'b1 && d_down == 1'b0) begin
		d_up =1; d_down=0; d_left=0; d_right =0; 
		end
	else if (down==1'b1 && d_up== 1'b0) begin
		d_up =0; d_down=1; d_left=0; d_right =0;
		end
	else if (left==1'b1 && d_right==1'b0) begin
		d_up =0; d_down=0; d_left=1; d_right =0;
		end
	else if (right==1'b1 && d_left==1'b0) begin
		d_up =0; d_down=0; d_left=0; d_right =1;
		end
	else begin
		d_up=d_up; d_down=d_down; d_left=d_left; d_right=d_right;
		end
end

//锟缴碉拷频时锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷头锟斤拷锟侥革拷锟斤拷锟斤拷锟剿讹拷
always@(posedge clk_5 or posedge RST)begin///////////////////////////////changed
	if(RST)begin
		x[0]<=16'b0000_0000_0100_0000;
		y[0]<=16'b0000_0000_0100_0000;
		end
	else begin
	if(d_up)begin
		x[0]<=x[0];
		y[0]<=y[0]<<1;
		end
	else if(d_down)begin
		x[0]<=x[0];
		y[0]<=y[0]>>1;
		end
	else if(d_left)begin
		x[0]<=x[0]<<1;
		y[0]<=y[0];
		end
	else if(d_right)begin
		x[0]<=x[0]>>1;
		y[0]<=y[0];
		end
	else begin
		x[0]<=x[0];
		y[0]<=y[0];
		end
	end
end

//锟斤拷锟斤拷头锟剿讹拷时锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟?
always@(posedge clk_5 or posedge RST)begin
	if(RST)begin
		x[1]<=16'b0000_0000_1000_0000;
		y[1]<=16'b0000_0000_0100_0000;
		x[2]<=16'b0000_0001_0000_0000;
		y[2]<=16'b0000_0000_0100_0000;
		x[3]<=16'b0000_0010_0000_0000;
		y[3]<=16'b0000_0000_0100_0000;
		x[4]<=0;y[4]<=0;x[5]<=0;y[5]<=0;x[6]<=0;y[6]<=0;x[7]<=0;y[7]<=0;x[8]<=0;y[8]<=0;x[9]<=0;y[9]<=0;x[10]<=0;y[10]<=0;
        x[11]<=0;y[11]<=0;x[12]<=0;y[12]<=0;x[13]<=0;y[13]<=0;x[14]<=0;y[14]<=0;x[15]<=0;y[15]<=0;x[16]<=0;y[16]<=0;x[17]<=0;y[17]<=0;x[18]<=0;y[18]<=0;x[19]<=0;y[19]<=0;x[20]<=0;y[20]<=0;
        x[21]<=0;y[21]<=0;x[22]<=0;y[22]<=0;x[23]<=0;y[23]<=0;x[24]<=0;y[24]<=0;x[25]<=0;y[25]<=0;x[26]<=0;y[26]<=0;x[27]<=0;y[27]<=0;x[28]<=0;y[28]<=0;x[29]<=0;y[29]<=0;x[30]<=0;y[30]<=0;
        x[31]<=0;y[31]<=0;x[32]<=0;y[32]<=0;x[33]<=0;y[33]<=0;x[34]<=0;y[34]<=0;x[35]<=0;y[35]<=0;x[36]<=0;y[36]<=0;x[37]<=0;y[37]<=0;x[38]<=0;y[38]<=0;x[39]<=0;y[39]<=0;x[40]<=0;y[40]<=0;
        x[41]<=0;y[41]<=0;x[42]<=0;y[42]<=0;x[43]<=0;y[43]<=0;x[44]<=0;y[44]<=0;x[45]<=0;y[45]<=0;x[46]<=0;y[46]<=0;x[47]<=0;y[47]<=0;x[48]<=0;y[48]<=0;x[49]<=0;y[49]<=0;x[50]<=0;y[50]<=0;
        x[51]<=0;y[51]<=0;x[52]<=0;y[52]<=0;x[53]<=0;y[53]<=0;x[54]<=0;y[54]<=0;x[55]<=0;y[55]<=0;x[56]<=0;y[56]<=0;x[57]<=0;y[57]<=0;x[58]<=0;y[58]<=0;x[59]<=0;y[59]<=0;x[60]<=0;y[60]<=0;
        x[61]<=0;y[61]<=0;x[62]<=0;y[62]<=0;x[63]<=0;y[63]<=0;x[64]<=0;y[64]<=0;x[65]<=0;y[65]<=0;x[66]<=0;y[66]<=0;x[67]<=0;y[67]<=0;x[68]<=0;y[68]<=0;x[69]<=0;y[69]<=0;x[70]<=0;y[70]<=0;
        x[71]<=0;y[71]<=0;x[72]<=0;y[72]<=0;x[73]<=0;y[73]<=0;x[74]<=0;y[74]<=0;x[75]<=0;y[75]<=0;x[76]<=0;y[76]<=0;x[77]<=0;y[77]<=0;x[78]<=0;y[78]<=0;x[79]<=0;y[79]<=0;x[80]<=0;y[80]<=0;
        x[81]<=0;y[81]<=0;x[82]<=0;y[82]<=0;x[83]<=0;y[83]<=0;x[84]<=0;y[84]<=0;x[85]<=0;y[85]<=0;x[86]<=0;y[86]<=0;x[87]<=0;y[87]<=0;x[88]<=0;y[88]<=0;x[89]<=0;y[89]<=0;x[90]<=0;y[90]<=0;
        x[91]<=0;y[91]<=0;x[92]<=0;y[92]<=0;x[93]<=0;y[93]<=0;x[94]<=0;y[94]<=0;x[95]<=0;y[95]<=0;x[96]<=0;y[96]<=0;x[97]<=0;y[97]<=0;x[98]<=0;y[98]<=0;x[99]<=0;y[99]<=0;
		end
	else begin
	if (DIE==1)begin
		x[1]<=x[1];y[1]<=y[1];x[2]<=x[2];y[2]<=y[2];x[3]<=x[3];y[3]<=y[3];x[4]<=x[4];y[4]<=y[4];x[5]<=x[5];y[5]<=y[5];
		x[6]<=x[6];y[6]<=y[6];x[7]<=x[7];y[7]<=y[7];x[8]<=x[8];y[8]<=y[8];x[9]<=x[9];y[9]<=y[9];x[10]<=x[10];y[10]<=y[10];
		x[11]<=x[11];y[11]<=y[11];x[12]<=x[12];y[12]<=y[12];x[13]<=x[13];y[13]<=y[13];x[14]<=x[14];y[14]<=y[14];x[15]<=x[15];y[15]<=y[15];
		x[16]<=x[16];y[16]<=y[16];x[17]<=x[17];y[17]<=y[17];x[18]<=x[18];y[18]<=y[18];x[19]<=x[19];y[19]<=y[19];x[20]<=x[20];y[20]<=y[20];
		x[21]<=x[21];y[21]<=y[21];x[22]<=x[22];y[22]<=y[22];x[23]<=x[23];y[23]<=y[23];x[24]<=x[24];y[24]<=y[24];x[25]<=x[25];y[25]<=y[25];
		x[26]<=x[26];y[26]<=y[26];x[27]<=x[27];y[27]<=y[27];x[28]<=x[28];y[28]<=y[28];x[29]<=x[29];y[29]<=y[29];x[30]<=x[30];y[30]<=y[30];
		x[31]<=x[31];y[31]<=y[31];x[32]<=x[32];y[32]<=y[32];x[33]<=x[33];y[33]<=y[33];x[34]<=x[34];y[34]<=y[34];x[35]<=x[35];y[35]<=y[35];
		x[36]<=x[36];y[36]<=y[36];x[37]<=x[37];y[37]<=y[37];x[38]<=x[38];y[38]<=y[38];x[39]<=x[39];y[39]<=y[39];x[40]<=x[40];y[40]<=y[40];
		x[41]<=x[41];y[41]<=y[41];x[42]<=x[42];y[42]<=y[42];x[43]<=x[43];y[43]<=y[43];x[44]<=x[44];y[44]<=y[44];x[45]<=x[45];y[45]<=y[45];
		x[46]<=x[46];y[46]<=y[46];x[47]<=x[47];y[47]<=y[47];x[48]<=x[48];y[48]<=y[48];x[49]<=x[49];y[49]<=y[49];x[50]<=x[50];y[50]<=y[50];
		x[51]<=x[51];y[51]<=y[51];x[52]<=x[52];y[52]<=y[52];x[53]<=x[53];y[53]<=y[53];x[54]<=x[54];y[54]<=y[54];x[55]<=x[55];y[55]<=y[55];
		x[56]<=x[56];y[56]<=y[56];x[57]<=x[57];y[57]<=y[57];x[58]<=x[58];y[58]<=y[58];x[59]<=x[59];y[59]<=y[59];x[60]<=x[60];y[60]<=y[60];
		x[61]<=x[61];y[61]<=y[61];x[62]<=x[62];y[62]<=y[62];x[63]<=x[63];y[63]<=y[63];x[64]<=x[64];y[64]<=y[64];x[65]<=x[65];y[65]<=y[65];
		x[66]<=x[66];y[66]<=y[66];x[67]<=x[67];y[67]<=y[67];x[68]<=x[68];y[68]<=y[68];x[69]<=x[69];y[69]<=y[69];x[70]<=x[70];y[70]<=y[70];
		x[71]<=x[71];y[71]<=y[71];x[72]<=x[72];y[72]<=y[72];x[73]<=x[73];y[73]<=y[73];x[74]<=x[74];y[74]<=y[74];x[75]<=x[75];y[75]<=y[75];
		x[76]<=x[76];y[76]<=y[76];x[77]<=x[77];y[77]<=y[77];x[78]<=x[78];y[78]<=y[78];x[79]<=x[79];y[79]<=y[79];x[80]<=x[80];y[80]<=y[80];
		x[81]<=x[81];y[81]<=y[81];x[82]<=x[82];y[82]<=y[82];x[83]<=x[83];y[83]<=y[83];x[84]<=x[84];y[84]<=y[84];x[85]<=x[85];y[85]<=y[85];
		x[86]<=x[86];y[86]<=y[86];x[87]<=x[87];y[87]<=y[87];x[88]<=x[88];y[88]<=y[88];x[89]<=x[89];y[89]<=y[89];x[90]<=x[90];y[90]<=y[90];
		x[91]<=x[91];y[91]<=y[91];x[92]<=x[92];y[92]<=y[92];x[93]<=x[93];y[93]<=y[93];x[94]<=x[94];y[94]<=y[94];x[95]<=x[95];y[95]<=y[95];
		x[96]<=x[96];y[96]<=y[96];x[97]<=x[97];y[97]<=y[97];x[98]<=x[98];y[98]<=y[98];x[99]<=x[99];y[99]<=y[99];
	end
	else if(d_up||d_down||d_left||d_right)begin
		x[1]<=x[0];y[1]<=y[0];x[2]<=x[1];y[2]<=y[1];x[3]<=x[2];y[3]<=y[2];x[4]<=x[3];y[4]<=y[3];x[5]<=x[4];y[5]<=y[4];
		x[6]<=x[5];y[6]<=y[5];x[7]<=x[6];y[7]<=y[6];x[8]<=x[7];y[8]<=y[7];x[9]<=x[8];y[9]<=y[8];x[10]<=x[9];y[10]<=y[9];
		x[11]<=x[10];y[11]<=y[10];x[12]<=x[11];y[12]<=y[11];x[13]<=x[12];y[13]<=y[12];x[14]<=x[13];y[14]<=y[13];x[15]<=x[14];y[15]<=y[14];
		x[16]<=x[15];y[16]<=y[15];x[17]<=x[16];y[17]<=y[16];x[18]<=x[17];y[18]<=y[17];x[19]<=x[18];y[19]<=y[18];x[20]<=x[19];y[20]<=y[19];
		x[21]<=x[20];y[21]<=y[20];x[22]<=x[21];y[22]<=y[21];x[23]<=x[22];y[23]<=y[22];x[24]<=x[23];y[24]<=y[23];x[25]<=x[24];y[25]<=y[24];
		x[26]<=x[25];y[26]<=y[25];x[27]<=x[26];y[27]<=y[26];x[28]<=x[27];y[28]<=y[27];x[29]<=x[28];y[29]<=y[28];x[30]<=x[29];y[30]<=y[29];
		x[31]<=x[30];y[31]<=y[30];x[32]<=x[31];y[32]<=y[31];x[33]<=x[32];y[33]<=y[32];x[34]<=x[33];y[34]<=y[33];x[35]<=x[34];y[35]<=y[34];
		x[36]<=x[35];y[36]<=y[35];x[37]<=x[36];y[37]<=y[36];x[38]<=x[37];y[38]<=y[37];x[39]<=x[38];y[39]<=y[38];x[40]<=x[39];y[40]<=y[39];
		x[41]<=x[40];y[41]<=y[40];x[42]<=x[41];y[42]<=y[41];x[43]<=x[42];y[43]<=y[42];x[44]<=x[43];y[44]<=y[43];x[45]<=x[44];y[45]<=y[44];
		x[46]<=x[45];y[46]<=y[45];x[47]<=x[46];y[47]<=y[46];x[48]<=x[47];y[48]<=y[47];x[49]<=x[48];y[49]<=y[48];x[50]<=x[49];y[50]<=y[49];
		x[51]<=x[50];y[51]<=y[50];x[52]<=x[51];y[52]<=y[51];x[53]<=x[52];y[53]<=y[52];x[54]<=x[53];y[54]<=y[53];x[55]<=x[54];y[55]<=y[54];
		x[56]<=x[55];y[56]<=y[55];x[57]<=x[56];y[57]<=y[56];x[58]<=x[57];y[58]<=y[57];x[59]<=x[58];y[59]<=y[58];x[60]<=x[59];y[60]<=y[59];
		x[61]<=x[60];y[61]<=y[60];x[62]<=x[61];y[62]<=y[61];x[63]<=x[62];y[63]<=y[62];x[64]<=x[63];y[64]<=y[63];x[65]<=x[64];y[65]<=y[64];
		x[66]<=x[65];y[66]<=y[65];x[67]<=x[66];y[67]<=y[66];x[68]<=x[67];y[68]<=y[67];x[69]<=x[68];y[69]<=y[68];x[70]<=x[69];y[70]<=y[69];
		x[71]<=x[70];y[71]<=y[70];x[72]<=x[71];y[72]<=y[71];x[73]<=x[72];y[73]<=y[72];x[74]<=x[73];y[74]<=y[73];x[75]<=x[74];y[75]<=y[74];
		x[76]<=x[75];y[76]<=y[75];x[77]<=x[76];y[77]<=y[76];x[78]<=x[77];y[78]<=y[77];x[79]<=x[78];y[79]<=y[78];x[80]<=x[79];y[80]<=y[79];
		x[81]<=x[80];y[81]<=y[80];x[82]<=x[81];y[82]<=y[81];x[83]<=x[82];y[83]<=y[82];x[84]<=x[83];y[84]<=y[83];x[85]<=x[84];y[85]<=y[84];
		x[86]<=x[85];y[86]<=y[85];x[87]<=x[86];y[87]<=y[86];x[88]<=x[87];y[88]<=y[87];x[89]<=x[88];y[89]<=y[88];x[90]<=x[89];y[90]<=y[89];
		x[91]<=x[90];y[91]<=y[90];x[92]<=x[91];y[92]<=y[91];x[93]<=x[92];y[93]<=y[92];x[94]<=x[93];y[94]<=y[93];x[95]<=x[94];y[95]<=y[94];
		x[96]<=x[95];y[96]<=y[95];x[97]<=x[96];y[97]<=y[96];x[98]<=x[97];y[98]<=y[97];x[99]<=x[98];y[99]<=y[98];
		end
	else begin
		x[1]<=x[1];y[1]<=y[1];x[2]<=x[2];y[2]<=y[2];x[3]<=x[3];y[3]<=y[3];x[4]<=x[4];y[4]<=y[4];x[5]<=x[5];y[5]<=y[5];
		x[6]<=x[6];y[6]<=y[6];x[7]<=x[7];y[7]<=y[7];x[8]<=x[8];y[8]<=y[8];x[9]<=x[9];y[9]<=y[9];x[10]<=x[10];y[10]<=y[10];
		x[11]<=x[11];y[11]<=y[11];x[12]<=x[12];y[12]<=y[12];x[13]<=x[13];y[13]<=y[13];x[14]<=x[14];y[14]<=y[14];x[15]<=x[15];y[15]<=y[15];
		x[16]<=x[16];y[16]<=y[16];x[17]<=x[17];y[17]<=y[17];x[18]<=x[18];y[18]<=y[18];x[19]<=x[19];y[19]<=y[19];x[20]<=x[20];y[20]<=y[20];
		x[21]<=x[21];y[21]<=y[21];x[22]<=x[22];y[22]<=y[22];x[23]<=x[23];y[23]<=y[23];x[24]<=x[24];y[24]<=y[24];x[25]<=x[25];y[25]<=y[25];
		x[26]<=x[26];y[26]<=y[26];x[27]<=x[27];y[27]<=y[27];x[28]<=x[28];y[28]<=y[28];x[29]<=x[29];y[29]<=y[29];x[30]<=x[30];y[30]<=y[30];
		x[31]<=x[31];y[31]<=y[31];x[32]<=x[32];y[32]<=y[32];x[33]<=x[33];y[33]<=y[33];x[34]<=x[34];y[34]<=y[34];x[35]<=x[35];y[35]<=y[35];
		x[36]<=x[36];y[36]<=y[36];x[37]<=x[37];y[37]<=y[37];x[38]<=x[38];y[38]<=y[38];x[39]<=x[39];y[39]<=y[39];x[40]<=x[40];y[40]<=y[40];
		x[41]<=x[41];y[41]<=y[41];x[42]<=x[42];y[42]<=y[42];x[43]<=x[43];y[43]<=y[43];x[44]<=x[44];y[44]<=y[44];x[45]<=x[45];y[45]<=y[45];
		x[46]<=x[46];y[46]<=y[46];x[47]<=x[47];y[47]<=y[47];x[48]<=x[48];y[48]<=y[48];x[49]<=x[49];y[49]<=y[49];x[50]<=x[50];y[50]<=y[50];
		x[51]<=x[51];y[51]<=y[51];x[52]<=x[52];y[52]<=y[52];x[53]<=x[53];y[53]<=y[53];x[54]<=x[54];y[54]<=y[54];x[55]<=x[55];y[55]<=y[55];
		x[56]<=x[56];y[56]<=y[56];x[57]<=x[57];y[57]<=y[57];x[58]<=x[58];y[58]<=y[58];x[59]<=x[59];y[59]<=y[59];x[60]<=x[60];y[60]<=y[60];
		x[61]<=x[61];y[61]<=y[61];x[62]<=x[62];y[62]<=y[62];x[63]<=x[63];y[63]<=y[63];x[64]<=x[64];y[64]<=y[64];x[65]<=x[65];y[65]<=y[65];
		x[66]<=x[66];y[66]<=y[66];x[67]<=x[67];y[67]<=y[67];x[68]<=x[68];y[68]<=y[68];x[69]<=x[69];y[69]<=y[69];x[70]<=x[70];y[70]<=y[70];
		x[71]<=x[71];y[71]<=y[71];x[72]<=x[72];y[72]<=y[72];x[73]<=x[73];y[73]<=y[73];x[74]<=x[74];y[74]<=y[74];x[75]<=x[75];y[75]<=y[75];
		x[76]<=x[76];y[76]<=y[76];x[77]<=x[77];y[77]<=y[77];x[78]<=x[78];y[78]<=y[78];x[79]<=x[79];y[79]<=y[79];x[80]<=x[80];y[80]<=y[80];
		x[81]<=x[81];y[81]<=y[81];x[82]<=x[82];y[82]<=y[82];x[83]<=x[83];y[83]<=y[83];x[84]<=x[84];y[84]<=y[84];x[85]<=x[85];y[85]<=y[85];
		x[86]<=x[86];y[86]<=y[86];x[87]<=x[87];y[87]<=y[87];x[88]<=x[88];y[88]<=y[88];x[89]<=x[89];y[89]<=y[89];x[90]<=x[90];y[90]<=y[90];
		x[91]<=x[91];y[91]<=y[91];x[92]<=x[92];y[92]<=y[92];x[93]<=x[93];y[93]<=y[93];x[94]<=x[94];y[94]<=y[94];x[95]<=x[95];y[95]<=y[95];
		x[96]<=x[96];y[96]<=y[96];x[97]<=x[97];y[97]<=y[97];x[98]<=x[98];y[98]<=y[98];x[99]<=x[99];y[99]<=y[99];
		end
		end
end

//size control module
assign size=score+4;
always@(posedge clk_5 or posedge RST)begin ///////////changed posedge clk_5 or posedge RST  //*
	if(RST)begin
	xx[0]<=16'b0000_0000_0100_0000;//add
    yy[0]<=16'b0000_0000_0100_0000;
	xx[1]<=16'h0;yy[1]<=16'h0;xx[2]<=16'h0;yy[2]<=16'h0;xx[3]<=16'h0;yy[3]<=16'h0;xx[4]<=16'h0;yy[4]<=16'h0;xx[5]<=16'h0;yy[5]<=16'h0;
	xx[6]<=16'h0;yy[6]<=16'h0;xx[7]<=16'h0;yy[7]<=16'h0;xx[8]<=16'h0;yy[8]<=16'h0;xx[9]<=16'h0;yy[9]<=16'h0;xx[10]<=16'h0;yy[10]<=16'h0;
	xx[11]<=16'h0;yy[11]<=16'h0;xx[12]<=16'h0;yy[12]<=16'h0;xx[13]<=16'h0;yy[13]<=16'h0;xx[14]<=16'h0;yy[14]<=16'h0;xx[15]<=16'h0;yy[15]<=16'h0;
	xx[16]<=16'h0;yy[16]<=16'h0;xx[17]<=16'h0;yy[17]<=16'h0;xx[18]<=16'h0;yy[18]<=16'h0;xx[19]<=16'h0;yy[19]<=16'h0;xx[20]<=16'h0;yy[20]<=16'h0;
	xx[21]<=16'h0;yy[21]<=16'h0;xx[22]<=16'h0;yy[22]<=16'h0;xx[23]<=16'h0;yy[23]<=16'h0;xx[24]<=16'h0;yy[24]<=16'h0;xx[25]<=16'h0;yy[25]<=16'h0;
	xx[26]<=16'h0;yy[26]<=16'h0;xx[27]<=16'h0;yy[27]<=16'h0;xx[28]<=16'h0;yy[28]<=16'h0;xx[29]<=16'h0;yy[29]<=16'h0;xx[30]<=16'h0;yy[30]<=16'h0;
	xx[31]<=16'h0;yy[31]<=16'h0;xx[32]<=16'h0;yy[32]<=16'h0;xx[33]<=16'h0;yy[33]<=16'h0;xx[34]<=16'h0;yy[34]<=16'h0;xx[35]<=16'h0;yy[35]<=16'h0;
	xx[36]<=16'h0;yy[36]<=16'h0;xx[37]<=16'h0;yy[37]<=16'h0;xx[38]<=16'h0;yy[38]<=16'h0;xx[39]<=16'h0;yy[39]<=16'h0;xx[40]<=16'h0;yy[40]<=16'h0;
	xx[41]<=16'h0;yy[41]<=16'h0;xx[42]<=16'h0;yy[42]<=16'h0;xx[43]<=16'h0;yy[43]<=16'h0;xx[44]<=16'h0;yy[44]<=16'h0;xx[45]<=16'h0;yy[45]<=16'h0;
	xx[46]<=16'h0;yy[46]<=16'h0;xx[47]<=16'h0;yy[47]<=16'h0;xx[48]<=16'h0;yy[48]<=16'h0;xx[49]<=16'h0;yy[49]<=16'h0;xx[50]<=16'h0;yy[50]<=16'h0;
	xx[51]<=16'h0;yy[51]<=16'h0;xx[52]<=16'h0;yy[52]<=16'h0;xx[53]<=16'h0;yy[53]<=16'h0;xx[54]<=16'h0;yy[54]<=16'h0;xx[55]<=16'h0;yy[55]<=16'h0;
	xx[56]<=16'h0;yy[56]<=16'h0;xx[57]<=16'h0;yy[57]<=16'h0;xx[58]<=16'h0;yy[58]<=16'h0;xx[59]<=16'h0;yy[59]<=16'h0;xx[60]<=16'h0;yy[60]<=16'h0;
	xx[61]<=16'h0;yy[61]<=16'h0;xx[62]<=16'h0;yy[62]<=16'h0;xx[63]<=16'h0;yy[63]<=16'h0;xx[64]<=16'h0;yy[64]<=16'h0;xx[65]<=16'h0;yy[65]<=16'h0;
	xx[66]<=16'h0;yy[66]<=16'h0;xx[67]<=16'h0;yy[67]<=16'h0;xx[68]<=16'h0;yy[68]<=16'h0;xx[69]<=16'h0;yy[69]<=16'h0;xx[70]<=16'h0;yy[70]<=16'h0;
	xx[71]<=16'h0;yy[71]<=16'h0;xx[72]<=16'h0;yy[72]<=16'h0;xx[73]<=16'h0;yy[73]<=16'h0;xx[74]<=16'h0;yy[74]<=16'h0;xx[75]<=16'h0;yy[75]<=16'h0;
	xx[76]<=16'h0;yy[76]<=16'h0;xx[77]<=16'h0;yy[77]<=16'h0;xx[78]<=16'h0;yy[78]<=16'h0;xx[79]<=16'h0;yy[79]<=16'h0;xx[80]<=16'h0;yy[80]<=16'h0;
	xx[81]<=16'h0;yy[81]<=16'h0;xx[82]<=16'h0;yy[82]<=16'h0;xx[83]<=16'h0;yy[83]<=16'h0;xx[84]<=16'h0;yy[84]<=16'h0;xx[85]<=16'h0;yy[85]<=16'h0;
	xx[86]<=16'h0;yy[86]<=16'h0;xx[87]<=16'h0;yy[87]<=16'h0;xx[88]<=16'h0;yy[88]<=16'h0;xx[89]<=16'h0;yy[89]<=16'h0;xx[90]<=16'h0;yy[90]<=16'h0;
	xx[91]<=16'h0;yy[91]<=16'h0;xx[92]<=16'h0;yy[92]<=16'h0;xx[93]<=16'h0;yy[93]<=16'h0;xx[94]<=16'h0;yy[94]<=16'h0;xx[95]<=16'h0;yy[95]<=16'h0;
	xx[96]<=16'h0;yy[96]<=16'h0;xx[97]<=16'h0;yy[97]<=16'h0;xx[98]<=16'h0;yy[98]<=16'h0;xx[99]<=16'h0;yy[99]<=16'h0;
	end
	else begin
	if(size>3)begin	/////////////////////////////////////////////////////////////////////////鏀?           /////////////////done
		xx[0]<=x[0];yy[0]<=y[0];xx[1]<=x[1];yy[1]<=y[1];xx[2]<=x[2];yy[2]<=y[2];xx[3]<=x[3];yy[3]<=y[3];
		end
	if(size>4) begin xx[4]<=x[4];yy[4]<=y[4]; end
	if(size>5) begin xx[5]<=x[5];yy[5]<=y[5]; end
	if(size>6) begin xx[6]<=x[6];yy[6]<=y[6]; end
	if(size>7) begin xx[7]<=x[7];yy[7]<=y[7]; end
	if(size>8) begin xx[8]<=x[8];yy[8]<=y[8]; end
	if(size>9) begin xx[9]<=x[9];yy[9]<=y[9]; end
	if(size>10) begin xx[10]<=x[10];yy[10]<=y[10]; end
	if(size>11) begin xx[11]<=x[11];yy[11]<=y[11]; end
	if(size>12) begin xx[12]<=x[12];yy[12]<=y[12]; end
	if(size>13) begin xx[13]<=x[13];yy[13]<=y[13]; end
	if(size>14) begin xx[14]<=x[14];yy[14]<=y[14]; end
	if(size>15) begin xx[15]<=x[15];yy[15]<=y[15]; end
	if(size>16) begin xx[16]<=x[16];yy[16]<=y[16]; end
	if(size>17) begin xx[17]<=x[17];yy[17]<=y[17]; end
	if(size>18) begin xx[18]<=x[18];yy[18]<=y[18]; end
	if(size>19) begin xx[19]<=x[19];yy[19]<=y[19]; end
	if(size>20) begin xx[20]<=x[20];yy[20]<=y[20]; end
	if(size>21) begin xx[21]<=x[21];yy[21]<=y[21]; end
	if(size>22) begin xx[22]<=x[22];yy[22]<=y[22]; end
	if(size>23) begin xx[23]<=x[23];yy[23]<=y[23]; end
	if(size>24) begin xx[24]<=x[24];yy[24]<=y[24]; end
	if(size>25) begin xx[25]<=x[25];yy[25]<=y[25]; end
	if(size>26) begin xx[26]<=x[26];yy[26]<=y[26]; end
	if(size>27) begin xx[27]<=x[27];yy[27]<=y[27]; end
	if(size>28) begin xx[28]<=x[28];yy[28]<=y[28]; end
	if(size>29) begin xx[29]<=x[29];yy[29]<=y[29]; end
	if(size>30) begin xx[30]<=x[30];yy[30]<=y[30]; end
	if(size>31) begin xx[31]<=x[31];yy[31]<=y[31]; end
	if(size>32) begin xx[32]<=x[32];yy[32]<=y[32]; end
	if(size>33) begin xx[33]<=x[33];yy[33]<=y[33]; end
	if(size>34) begin xx[34]<=x[34];yy[34]<=y[34]; end
	if(size>35) begin xx[35]<=x[35];yy[35]<=y[35]; end
	if(size>36) begin xx[36]<=x[36];yy[36]<=y[36]; end
	if(size>37) begin xx[37]<=x[37];yy[37]<=y[37]; end
	if(size>38) begin xx[38]<=x[38];yy[38]<=y[38]; end
	if(size>39) begin xx[39]<=x[39];yy[39]<=y[39]; end
	if(size>40) begin xx[40]<=x[40];yy[40]<=y[40]; end
	if(size>41) begin xx[41]<=x[41];yy[41]<=y[41]; end
	if(size>42) begin xx[42]<=x[42];yy[42]<=y[42]; end
	if(size>43) begin xx[43]<=x[43];yy[43]<=y[43]; end
	if(size>44) begin xx[44]<=x[44];yy[44]<=y[44]; end
	if(size>45) begin xx[45]<=x[45];yy[45]<=y[45]; end
	if(size>46) begin xx[46]<=x[46];yy[46]<=y[46]; end
	if(size>47) begin xx[47]<=x[47];yy[47]<=y[47]; end
	if(size>48) begin xx[48]<=x[48];yy[48]<=y[48]; end
	if(size>49) begin xx[49]<=x[49];yy[49]<=y[49]; end
	if(size>50) begin xx[50]<=x[50];yy[50]<=y[50]; end
	if(size>51) begin xx[51]<=x[51];yy[51]<=y[51]; end
	if(size>52) begin xx[52]<=x[52];yy[52]<=y[52]; end
	if(size>53) begin xx[53]<=x[53];yy[53]<=y[53]; end
	if(size>54) begin xx[54]<=x[54];yy[54]<=y[54]; end
	if(size>55) begin xx[55]<=x[55];yy[55]<=y[55]; end
	if(size>56) begin xx[56]<=x[56];yy[56]<=y[56]; end
	if(size>57) begin xx[57]<=x[57];yy[57]<=y[57]; end
	if(size>58) begin xx[58]<=x[58];yy[58]<=y[58]; end
	if(size>59) begin xx[59]<=x[59];yy[59]<=y[59]; end
	if(size>60) begin xx[60]<=x[60];yy[60]<=y[60]; end
	if(size>61) begin xx[61]<=x[61];yy[61]<=y[61]; end
	if(size>62) begin xx[62]<=x[62];yy[62]<=y[62]; end
	if(size>63) begin xx[63]<=x[63];yy[63]<=y[63]; end
	if(size>64) begin xx[64]<=x[64];yy[64]<=y[64]; end
	if(size>65) begin xx[65]<=x[65];yy[65]<=y[65]; end
	if(size>66) begin xx[66]<=x[66];yy[66]<=y[66]; end
	if(size>67) begin xx[67]<=x[67];yy[67]<=y[67]; end
	if(size>68) begin xx[68]<=x[68];yy[68]<=y[68]; end
	if(size>69) begin xx[69]<=x[69];yy[69]<=y[69]; end
	if(size>70) begin xx[70]<=x[70];yy[70]<=y[70]; end
	if(size>71) begin xx[71]<=x[71];yy[71]<=y[71]; end
	if(size>72) begin xx[72]<=x[72];yy[72]<=y[72]; end
	if(size>73) begin xx[73]<=x[73];yy[73]<=y[73]; end
	if(size>74) begin xx[74]<=x[74];yy[74]<=y[74]; end
	if(size>75) begin xx[75]<=x[75];yy[75]<=y[75]; end
	if(size>76) begin xx[76]<=x[76];yy[76]<=y[76]; end
	if(size>77) begin xx[77]<=x[77];yy[77]<=y[77]; end
	if(size>78) begin xx[78]<=x[78];yy[78]<=y[78]; end
	if(size>79) begin xx[79]<=x[79];yy[79]<=y[79]; end
	if(size>80) begin xx[80]<=x[80];yy[80]<=y[80]; end
	if(size>81) begin xx[81]<=x[81];yy[81]<=y[81]; end
	if(size>82) begin xx[82]<=x[82];yy[82]<=y[82]; end
	if(size>83) begin xx[83]<=x[83];yy[83]<=y[83]; end
	if(size>84) begin xx[84]<=x[84];yy[84]<=y[84]; end
	if(size>85) begin xx[85]<=x[85];yy[85]<=y[85]; end
	if(size>86) begin xx[86]<=x[86];yy[86]<=y[86]; end
	if(size>87) begin xx[87]<=x[87];yy[87]<=y[87]; end
	if(size>88) begin xx[88]<=x[88];yy[88]<=y[88]; end
	if(size>89) begin xx[89]<=x[89];yy[89]<=y[89]; end
	if(size>90) begin xx[90]<=x[90];yy[90]<=y[90]; end
	if(size>91) begin xx[91]<=x[91];yy[91]<=y[91]; end
	if(size>92) begin xx[92]<=x[92];yy[92]<=y[92]; end
	if(size>93) begin xx[93]<=x[93];yy[93]<=y[93]; end
	if(size>94) begin xx[94]<=x[94];yy[94]<=y[94]; end
	if(size>95) begin xx[95]<=x[95];yy[95]<=y[95]; end
	if(size>96) begin xx[96]<=x[96];yy[96]<=y[96]; end
	if(size>97) begin xx[97]<=x[97];yy[97]<=y[97]; end
	if(size>98) begin xx[98]<=x[98];yy[98]<=y[98]; end
	if(size>99) begin xx[99]<=x[99];yy[99]<=y[99]; end
	end
end

  //锟斤拷锟斤拷锟叫讹拷模锟斤拷
always@(posedge clk_5 or posedge RST)begin ///////changed form * to this
	if(RST)begin
		DIE<=0;
		end
	else begin
	if(x[0]==16'b0|| y[0]==16'b0 )
		DIE<=1;
	else if(
        xx[0]==xx[1]&&yy[0]==yy[1]||xx[0]==xx[2]&&yy[0]==yy[2]||xx[0]==xx[3]&&yy[0]==yy[3]||xx[0]==xx[4]&&yy[0]==yy[4]||xx[0]==xx[5]&&yy[0]==yy[5]||
        xx[0]==xx[6]&&yy[0]==yy[6]||xx[0]==xx[7]&&yy[0]==yy[7]||xx[0]==xx[8]&&yy[0]==yy[8]||xx[0]==xx[9]&&yy[0]==yy[9]||xx[0]==xx[10]&&yy[0]==yy[10]||
        xx[0]==xx[11]&&yy[0]==yy[11]||xx[0]==xx[12]&&yy[0]==yy[12]||xx[0]==xx[13]&&yy[0]==yy[13]||xx[0]==xx[14]&&yy[0]==yy[14]||xx[0]==xx[15]&&yy[0]==yy[15]||
        xx[0]==xx[16]&&yy[0]==yy[16]||xx[0]==xx[17]&&yy[0]==yy[17]||xx[0]==xx[18]&&yy[0]==yy[18]||xx[0]==xx[19]&&yy[0]==yy[19]||xx[0]==xx[20]&&yy[0]==yy[20]||
        xx[0]==xx[21]&&yy[0]==yy[21]||xx[0]==xx[22]&&yy[0]==yy[22]||xx[0]==xx[23]&&yy[0]==yy[23]||xx[0]==xx[24]&&yy[0]==yy[24]||xx[0]==xx[25]&&yy[0]==yy[25]||
        xx[0]==xx[26]&&yy[0]==yy[26]||xx[0]==xx[27]&&yy[0]==yy[27]||xx[0]==xx[28]&&yy[0]==yy[28]||xx[0]==xx[29]&&yy[0]==yy[29]||xx[0]==xx[30]&&yy[0]==yy[30]||
        xx[0]==xx[31]&&yy[0]==yy[31]||xx[0]==xx[32]&&yy[0]==yy[32]||xx[0]==xx[33]&&yy[0]==yy[33]||xx[0]==xx[34]&&yy[0]==yy[34]||xx[0]==xx[35]&&yy[0]==yy[35]||
        xx[0]==xx[36]&&yy[0]==yy[36]||xx[0]==xx[37]&&yy[0]==yy[37]||xx[0]==xx[38]&&yy[0]==yy[38]||xx[0]==xx[39]&&yy[0]==yy[39]||xx[0]==xx[40]&&yy[0]==yy[40]||
        xx[0]==xx[41]&&yy[0]==yy[41]||xx[0]==xx[42]&&yy[0]==yy[42]||xx[0]==xx[43]&&yy[0]==yy[43]||xx[0]==xx[44]&&yy[0]==yy[44]||xx[0]==xx[45]&&yy[0]==yy[45]||
        xx[0]==xx[46]&&yy[0]==yy[46]||xx[0]==xx[47]&&yy[0]==yy[47]||xx[0]==xx[48]&&yy[0]==yy[48]||xx[0]==xx[49]&&yy[0]==yy[49]||xx[0]==xx[50]&&yy[0]==yy[50]||
        xx[0]==xx[51]&&yy[0]==yy[51]||xx[0]==xx[52]&&yy[0]==yy[52]||xx[0]==xx[53]&&yy[0]==yy[53]||xx[0]==xx[54]&&yy[0]==yy[54]||xx[0]==xx[55]&&yy[0]==yy[55]||
        xx[0]==xx[56]&&yy[0]==yy[56]||xx[0]==xx[57]&&yy[0]==yy[57]||xx[0]==xx[58]&&yy[0]==yy[58]||xx[0]==xx[59]&&yy[0]==yy[59]||xx[0]==xx[60]&&yy[0]==yy[60]||
        xx[0]==xx[61]&&yy[0]==yy[61]||xx[0]==xx[62]&&yy[0]==yy[62]||xx[0]==xx[63]&&yy[0]==yy[63]||xx[0]==xx[64]&&yy[0]==yy[64]||xx[0]==xx[65]&&yy[0]==yy[65]||
        xx[0]==xx[66]&&yy[0]==yy[66]||xx[0]==xx[67]&&yy[0]==yy[67]||xx[0]==xx[68]&&yy[0]==yy[68]||xx[0]==xx[69]&&yy[0]==yy[69]||xx[0]==xx[70]&&yy[0]==yy[70]||
        xx[0]==xx[71]&&yy[0]==yy[71]||xx[0]==xx[72]&&yy[0]==yy[72]||xx[0]==xx[73]&&yy[0]==yy[73]||xx[0]==xx[74]&&yy[0]==yy[74]||xx[0]==xx[75]&&yy[0]==yy[75]||
        xx[0]==xx[76]&&yy[0]==yy[76]||xx[0]==xx[77]&&yy[0]==yy[77]||xx[0]==xx[78]&&yy[0]==yy[78]||xx[0]==xx[79]&&yy[0]==yy[79]||xx[0]==xx[80]&&yy[0]==yy[80]||
        xx[0]==xx[81]&&yy[0]==yy[81]||xx[0]==xx[82]&&yy[0]==yy[82]||xx[0]==xx[83]&&yy[0]==yy[83]||xx[0]==xx[84]&&yy[0]==yy[84]||xx[0]==xx[85]&&yy[0]==yy[85]||
        xx[0]==xx[86]&&yy[0]==yy[86]||xx[0]==xx[87]&&yy[0]==yy[87]||xx[0]==xx[88]&&yy[0]==yy[88]||xx[0]==xx[89]&&yy[0]==yy[89]||xx[0]==xx[90]&&yy[0]==yy[90]||
        xx[0]==xx[91]&&yy[0]==yy[91]||xx[0]==xx[92]&&yy[0]==yy[92]||xx[0]==xx[93]&&yy[0]==yy[93]||xx[0]==xx[94]&&yy[0]==yy[94]||xx[0]==xx[95]&&yy[0]==yy[95]||
        xx[0]==xx[96]&&yy[0]==yy[96]||xx[0]==xx[97]&&yy[0]==yy[97]||xx[0]==xx[98]&&yy[0]==yy[98]||xx[0]==xx[99]&&yy[0]==yy[99])
		DIE<=1;
	else 
	   DIE<=DIE;
	end
	end

reg eat=0;
//锟矫凤拷锟叫讹拷模锟斤拷
always@(posedge clk_5 or posedge RST)begin//changed
	if(RST)begin
		score<=0;
		eat<=0;
		end
	else if(xx[0]==apple_x&&yy[0]==apple_y) begin
		score<=score+1;
		eat<=1;
		end
	else begin
		score<=score;
		eat<=0;
		end
end

//锟斤拷锟斤拷锟斤拷锟斤拷苹锟斤拷锟斤拷锟斤拷模锟斤拷
//new_apple_x锟斤拷new_apple_y锟斤拷浴锟斤拷锟斤拷锟斤拷锟侥ｏ拷锟?
reg [2:0] current_state=0;
reg [2:0] next_state=0;
wire [15:0] new_apple_x;
wire [15:0] new_apple_y;
reg [15:0] t_x=0;
reg [15:0] t_y=0;

parameter s0=0;
parameter s1=1;
parameter s2=2;
parameter s3=3;
parameter s4=4;
parameter s5=5;

	random rand_x(
		.clock(clk),
		.max_number(255),
		.min_number(0),
		.step(7),
		.num_out(new_apple_x)
	);

	random rand_y(
		.clock(clk),
		.max_number(256),
		.min_number(1),
		.step(11),
		.num_out(new_apple_y)
	);
	
always@(posedge clk)begin
	current_state<=next_state;
end

always@(*)begin		//状态锟斤拷转锟斤拷锟斤拷
	case(current_state)
	s0:begin
		if(eat)
			next_state<=s1;
		else
			next_state<=s0;
		end
	s1:begin
		if(new_apple_x==xx[0]&&new_apple_y==yy[0]||
	new_apple_x==xx[1]&&new_apple_y==yy[1]||new_apple_x==xx[2]&&new_apple_y==yy[2]||new_apple_x==xx[3]&&new_apple_y==yy[3]||new_apple_x==xx[4]&&new_apple_y==yy[4]||new_apple_x==xx[5]&&new_apple_y==yy[5]||
	new_apple_x==xx[6]&&new_apple_y==yy[6]||new_apple_x==xx[7]&&new_apple_y==yy[7]||new_apple_x==xx[8]&&new_apple_y==yy[8]||new_apple_x==xx[9]&&new_apple_y==yy[9]||new_apple_x==xx[10]&&new_apple_y==yy[10]||
	new_apple_x==xx[11]&&new_apple_y==yy[11]||new_apple_x==xx[12]&&new_apple_y==yy[12]||new_apple_x==xx[13]&&new_apple_y==yy[13]||new_apple_x==xx[14]&&new_apple_y==yy[14]||new_apple_x==xx[15]&&new_apple_y==yy[15]||
	new_apple_x==xx[16]&&new_apple_y==yy[16]||new_apple_x==xx[17]&&new_apple_y==yy[17]||new_apple_x==xx[18]&&new_apple_y==yy[18]||new_apple_x==xx[19]&&new_apple_y==yy[19]||new_apple_x==xx[20]&&new_apple_y==yy[20]||
	new_apple_x==xx[21]&&new_apple_y==yy[21]||new_apple_x==xx[22]&&new_apple_y==yy[22]||new_apple_x==xx[23]&&new_apple_y==yy[23]||new_apple_x==xx[24]&&new_apple_y==yy[24]||new_apple_x==xx[25]&&new_apple_y==yy[25]||
	new_apple_x==xx[26]&&new_apple_y==yy[26]||new_apple_x==xx[27]&&new_apple_y==yy[27]||new_apple_x==xx[28]&&new_apple_y==yy[28]||new_apple_x==xx[29]&&new_apple_y==yy[29]||new_apple_x==xx[30]&&new_apple_y==yy[30]||
	new_apple_x==xx[31]&&new_apple_y==yy[31]||new_apple_x==xx[32]&&new_apple_y==yy[32]||new_apple_x==xx[33]&&new_apple_y==yy[33]||new_apple_x==xx[34]&&new_apple_y==yy[34]||new_apple_x==xx[35]&&new_apple_y==yy[35]||
	new_apple_x==xx[36]&&new_apple_y==yy[36]||new_apple_x==xx[37]&&new_apple_y==yy[37]||new_apple_x==xx[38]&&new_apple_y==yy[38]||new_apple_x==xx[39]&&new_apple_y==yy[39]||new_apple_x==xx[40]&&new_apple_y==yy[40]||
	new_apple_x==xx[41]&&new_apple_y==yy[41]||new_apple_x==xx[42]&&new_apple_y==yy[42]||new_apple_x==xx[43]&&new_apple_y==yy[43]||new_apple_x==xx[44]&&new_apple_y==yy[44]||new_apple_x==xx[45]&&new_apple_y==yy[45]||
	new_apple_x==xx[46]&&new_apple_y==yy[46]||new_apple_x==xx[47]&&new_apple_y==yy[47]||new_apple_x==xx[48]&&new_apple_y==yy[48]||new_apple_x==xx[49]&&new_apple_y==yy[49]||new_apple_x==xx[50]&&new_apple_y==yy[50]||
	new_apple_x==xx[51]&&new_apple_y==yy[51]||new_apple_x==xx[52]&&new_apple_y==yy[52]||new_apple_x==xx[53]&&new_apple_y==yy[53]||new_apple_x==xx[54]&&new_apple_y==yy[54]||new_apple_x==xx[55]&&new_apple_y==yy[55]||
	new_apple_x==xx[56]&&new_apple_y==yy[56]||new_apple_x==xx[57]&&new_apple_y==yy[57]||new_apple_x==xx[58]&&new_apple_y==yy[58]||new_apple_x==xx[59]&&new_apple_y==yy[59]||new_apple_x==xx[60]&&new_apple_y==yy[60]||
	new_apple_x==xx[61]&&new_apple_y==yy[61]||new_apple_x==xx[62]&&new_apple_y==yy[62]||new_apple_x==xx[63]&&new_apple_y==yy[63]||new_apple_x==xx[64]&&new_apple_y==yy[64]||new_apple_x==xx[65]&&new_apple_y==yy[65]||
	new_apple_x==xx[66]&&new_apple_y==yy[66]||new_apple_x==xx[67]&&new_apple_y==yy[67]||new_apple_x==xx[68]&&new_apple_y==yy[68]||new_apple_x==xx[69]&&new_apple_y==yy[69]||new_apple_x==xx[70]&&new_apple_y==yy[70]||
	new_apple_x==xx[71]&&new_apple_y==yy[71]||new_apple_x==xx[72]&&new_apple_y==yy[72]||new_apple_x==xx[73]&&new_apple_y==yy[73]||new_apple_x==xx[74]&&new_apple_y==yy[74]||new_apple_x==xx[75]&&new_apple_y==yy[75]||
	new_apple_x==xx[76]&&new_apple_y==yy[76]||new_apple_x==xx[77]&&new_apple_y==yy[77]||new_apple_x==xx[78]&&new_apple_y==yy[78]||new_apple_x==xx[79]&&new_apple_y==yy[79]||new_apple_x==xx[80]&&new_apple_y==yy[80]||
	new_apple_x==xx[81]&&new_apple_y==yy[81]||new_apple_x==xx[82]&&new_apple_y==yy[82]||new_apple_x==xx[83]&&new_apple_y==yy[83]||new_apple_x==xx[84]&&new_apple_y==yy[84]||new_apple_x==xx[85]&&new_apple_y==yy[85]||
	new_apple_x==xx[86]&&new_apple_y==yy[86]||new_apple_x==xx[87]&&new_apple_y==yy[87]||new_apple_x==xx[88]&&new_apple_y==yy[88]||new_apple_x==xx[89]&&new_apple_y==yy[89]||new_apple_x==xx[90]&&new_apple_y==yy[90]||
	new_apple_x==xx[91]&&new_apple_y==yy[91]||new_apple_x==xx[92]&&new_apple_y==yy[92]||new_apple_x==xx[93]&&new_apple_y==yy[93]||new_apple_x==xx[94]&&new_apple_y==yy[94]||new_apple_x==xx[95]&&new_apple_y==yy[95]||
	new_apple_x==xx[96]&&new_apple_y==yy[96]||new_apple_x==xx[97]&&new_apple_y==yy[97]||new_apple_x==xx[98]&&new_apple_y==yy[98]||new_apple_x==xx[99]&&new_apple_y==yy[99])	//////////////////////////////////////////////
			next_state<=s1;
		else
			next_state<=s2;
		end
	s2:begin
	   if(eat==1)
	    next_state<=s2;
	   else
		next_state<=s0;
	end
	default:
		next_state<=s0;
	endcase
end
	/*x[0]<=16'b0000_0000_0100_0000;
		y[0]<=16'b0000_0000_0100_0000;*/
always@(posedge clk)begin		//锟斤拷同状态锟斤拷锟斤拷锟斤拷	//////////////////////////////////changed from * to posedge clk
	if(RST)begin
		apple_x<=16'b0001_0000_0000_0000;
		apple_y<=16'b0000_1000_0000_0000;
		t_x<=0;t_y<=0;
	end
	else begin
	case(current_state)
	s0:begin
		apple_x<=apple_x;
		apple_y<=apple_y;
		t_x<=t_x;t_y<=t_y;
		end
	s1:begin
		apple_x<=apple_x;
		apple_y<=apple_y;
		t_x<=new_apple_x;
		t_y<=new_apple_y;
		end
	s2:begin
		apple_x<=t_x;
		apple_y<=t_y;
		t_x<=t_x;t_y<=t_y;
		end
	default:begin
		apple_x<=apple_x;
		apple_y<=apple_y;
		t_x<=t_x;t_y<=t_y;
		end
	endcase
	end
end

//锟斤拷LED锟斤拷锟斤拷锟较碉拷锟斤拷锟斤拷

reg [15:0] row;
reg [3:0] cnt1=0;
reg [15:0] col [100:0];
wire [15:0] col_temp;

//锟斤拷锟斤拷锟斤拷扫锟斤拷锟脚猴拷
always@(posedge clk_800) begin
	cnt1<=cnt1+1;
end

always@(*)begin
	case(cnt1)
	4'd0:row<=16'b0000_0000_0000_0001;
	4'd1:row<=16'b0000_0000_0000_0001<<1;
	4'd2:row<=16'b0000_0000_0000_0001<<2;
	4'd3:row<=16'b0000_0000_0000_0001<<3;
	4'd4:row<=16'b0000_0000_0000_0001<<4;
	4'd5:row<=16'b0000_0000_0000_0001<<5;
	4'd6:row<=16'b0000_0000_0000_0001<<6;
	4'd7:row<=16'b0000_0000_0000_0001<<7;
	4'd8:row<=16'b0000_0000_0000_0001<<8;
	4'd9:row<=16'b0000_0000_0000_0001<<9;
	4'd10:row<=16'b0000_0000_0000_0001<<10;
	4'd11:row<=16'b0000_0000_0000_0001<<11;
	4'd12:row<=16'b0000_0000_0000_0001<<12;
	4'd13:row<=16'b0000_0000_0000_0001<<13;
	4'd14:row<=16'b0000_0000_0000_0001<<14;
	4'd15:row<=16'b0000_0000_0000_0001<<15;
	default:row<=16'b0;
	endcase
end

//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷苹锟斤拷锟斤拷锟斤拷锟疥，锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟脚猴拷
always@(*)begin
	if(row==apple_x) col[100]<=apple_y; else col[100]<=0;
	if(row==xx[0]) col[0]<=yy[0]; else col[0]<=0;
	if(row==xx[1]) col[1]<=yy[1]; else col[1]<=0;if(row==xx[2]) col[2]<=yy[2]; else col[2]<=0;if(row==xx[3]) col[3]<=yy[3]; else col[3]<=0;if(row==xx[4]) col[4]<=yy[4]; else col[4]<=0;if(row==xx[5]) col[5]<=yy[5]; else col[5]<=0;
	if(row==xx[6]) col[6]<=yy[6]; else col[6]<=0;if(row==xx[7]) col[7]<=yy[7]; else col[7]<=0;if(row==xx[8]) col[8]<=yy[8]; else col[8]<=0;if(row==xx[9]) col[9]<=yy[9]; else col[9]<=0;if(row==xx[10]) col[10]<=yy[10]; else col[10]<=0;
	if(row==xx[11]) col[11]<=yy[11]; else col[11]<=0;if(row==xx[12]) col[12]<=yy[12]; else col[12]<=0;if(row==xx[13]) col[13]<=yy[13]; else col[13]<=0;if(row==xx[14]) col[14]<=yy[14]; else col[14]<=0;if(row==xx[15]) col[15]<=yy[15]; else col[15]<=0;
	if(row==xx[16]) col[16]<=yy[16]; else col[16]<=0;if(row==xx[17]) col[17]<=yy[17]; else col[17]<=0;if(row==xx[18]) col[18]<=yy[18]; else col[18]<=0;if(row==xx[19]) col[19]<=yy[19]; else col[19]<=0;if(row==xx[20]) col[20]<=yy[20]; else col[20]<=0;
	if(row==xx[21]) col[21]<=yy[21]; else col[21]<=0;if(row==xx[22]) col[22]<=yy[22]; else col[22]<=0;if(row==xx[23]) col[23]<=yy[23]; else col[23]<=0;if(row==xx[24]) col[24]<=yy[24]; else col[24]<=0;if(row==xx[25]) col[25]<=yy[25]; else col[25]<=0;
	if(row==xx[26]) col[26]<=yy[26]; else col[26]<=0;if(row==xx[27]) col[27]<=yy[27]; else col[27]<=0;if(row==xx[28]) col[28]<=yy[28]; else col[28]<=0;if(row==xx[29]) col[29]<=yy[29]; else col[29]<=0;if(row==xx[30]) col[30]<=yy[30]; else col[30]<=0;
	if(row==xx[31]) col[31]<=yy[31]; else col[31]<=0;if(row==xx[32]) col[32]<=yy[32]; else col[32]<=0;if(row==xx[33]) col[33]<=yy[33]; else col[33]<=0;if(row==xx[34]) col[34]<=yy[34]; else col[34]<=0;if(row==xx[35]) col[35]<=yy[35]; else col[35]<=0;
	if(row==xx[36]) col[36]<=yy[36]; else col[36]<=0;if(row==xx[37]) col[37]<=yy[37]; else col[37]<=0;if(row==xx[38]) col[38]<=yy[38]; else col[38]<=0;if(row==xx[39]) col[39]<=yy[39]; else col[39]<=0;if(row==xx[40]) col[40]<=yy[40]; else col[40]<=0;
	if(row==xx[41]) col[41]<=yy[41]; else col[41]<=0;if(row==xx[42]) col[42]<=yy[42]; else col[42]<=0;if(row==xx[43]) col[43]<=yy[43]; else col[43]<=0;if(row==xx[44]) col[44]<=yy[44]; else col[44]<=0;if(row==xx[45]) col[45]<=yy[45]; else col[45]<=0;
	if(row==xx[46]) col[46]<=yy[46]; else col[46]<=0;if(row==xx[47]) col[47]<=yy[47]; else col[47]<=0;if(row==xx[48]) col[48]<=yy[48]; else col[48]<=0;if(row==xx[49]) col[49]<=yy[49]; else col[49]<=0;if(row==xx[50]) col[50]<=yy[50]; else col[50]<=0;
	if(row==xx[51]) col[51]<=yy[51]; else col[51]<=0;if(row==xx[52]) col[52]<=yy[52]; else col[52]<=0;if(row==xx[53]) col[53]<=yy[53]; else col[53]<=0;if(row==xx[54]) col[54]<=yy[54]; else col[54]<=0;if(row==xx[55]) col[55]<=yy[55]; else col[55]<=0;
	if(row==xx[56]) col[56]<=yy[56]; else col[56]<=0;if(row==xx[57]) col[57]<=yy[57]; else col[57]<=0;if(row==xx[58]) col[58]<=yy[58]; else col[58]<=0;if(row==xx[59]) col[59]<=yy[59]; else col[59]<=0;if(row==xx[60]) col[60]<=yy[60]; else col[60]<=0;
	if(row==xx[61]) col[61]<=yy[61]; else col[61]<=0;if(row==xx[62]) col[62]<=yy[62]; else col[62]<=0;if(row==xx[63]) col[63]<=yy[63]; else col[63]<=0;if(row==xx[64]) col[64]<=yy[64]; else col[64]<=0;if(row==xx[65]) col[65]<=yy[65]; else col[65]<=0;
	if(row==xx[66]) col[66]<=yy[66]; else col[66]<=0;if(row==xx[67]) col[67]<=yy[67]; else col[67]<=0;if(row==xx[68]) col[68]<=yy[68]; else col[68]<=0;if(row==xx[69]) col[69]<=yy[69]; else col[69]<=0;if(row==xx[70]) col[70]<=yy[70]; else col[70]<=0;
	if(row==xx[71]) col[71]<=yy[71]; else col[71]<=0;if(row==xx[72]) col[72]<=yy[72]; else col[72]<=0;if(row==xx[73]) col[73]<=yy[73]; else col[73]<=0;if(row==xx[74]) col[74]<=yy[74]; else col[74]<=0;if(row==xx[75]) col[75]<=yy[75]; else col[75]<=0;
	if(row==xx[76]) col[76]<=yy[76]; else col[76]<=0;if(row==xx[77]) col[77]<=yy[77]; else col[77]<=0;if(row==xx[78]) col[78]<=yy[78]; else col[78]<=0;if(row==xx[79]) col[79]<=yy[79]; else col[79]<=0;if(row==xx[80]) col[80]<=yy[80]; else col[80]<=0;
	if(row==xx[81]) col[81]<=yy[81]; else col[81]<=0;if(row==xx[82]) col[82]<=yy[82]; else col[82]<=0;if(row==xx[83]) col[83]<=yy[83]; else col[83]<=0;if(row==xx[84]) col[84]<=yy[84]; else col[84]<=0;if(row==xx[85]) col[85]<=yy[85]; else col[85]<=0;
	if(row==xx[86]) col[86]<=yy[86]; else col[86]<=0;if(row==xx[87]) col[87]<=yy[87]; else col[87]<=0;if(row==xx[88]) col[88]<=yy[88]; else col[88]<=0;if(row==xx[89]) col[89]<=yy[89]; else col[89]<=0;if(row==xx[90]) col[90]<=yy[90]; else col[90]<=0;
	if(row==xx[91]) col[91]<=yy[91]; else col[91]<=0;if(row==xx[92]) col[92]<=yy[92]; else col[92]<=0;if(row==xx[93]) col[93]<=yy[93]; else col[93]<=0;if(row==xx[94]) col[94]<=yy[94]; else col[94]<=0;if(row==xx[95]) col[95]<=yy[95]; else col[95]<=0;
	if(row==xx[96]) col[96]<=yy[96]; else col[96]<=0;if(row==xx[97]) col[97]<=yy[97]; else col[97]<=0;if(row==xx[98]) col[98]<=yy[98]; else col[98]<=0;if(row==xx[99]) col[99]<=yy[99]; else col[99]<=0;
end

assign col_temp=col[0]|col[100]|col[1]|col[2]|col[3]|col[4]|col[5]|col[6]|col[7]|col[8]|col[9]|col[10]|col[11]|col[12]|col[13]|col[14]|col[15]|col[16]|col[17]|col[18]|col[19]|col[20]|col[21]|col[22]|col[23]|col[24]|col[25]|col[26]|col[27]|col[28]|col[29]|col[30]|col[31]|col[32]|col[33]|col[34]|col[35]|col[36]|col[37]|col[38]|col[39]|col[40]|col[41]|col[42]|col[43]|col[44]|col[45]|col[46]|col[47]|col[48]|col[49]|col[50]|col[51]|col[52]|col[53]|col[54]|col[55]|col[56]|col[57]|col[58]|col[59]|col[60]|col[61]|col[62]|col[63]|col[64]|col[65]|col[66]|col[67]|col[68]|col[69]|col[70]|col[71]|col[72]|col[73]|col[74]|col[75]|col[76]|col[77]|col[78]|col[79]|col[80]|col[81]|col[82]|col[83]|col[84]|col[85]|col[86]|col[87]|col[88]|col[89]|col[90]|col[91]|col[92]|col[93]|col[94]|col[95]|col[96]|col[97]|col[98]|col[99];
reg [15:0] temccc=0;
always @(*)begin
	if(DIE==1)begin
		if(clk_5)temccc<=col_temp;
		else temccc<=32767;
	end
	else
		temccc<=col_temp;
	end

//取锟斤拷锟斤拷锟斤拷
assign display_x=~row;
assign display_y=~temccc;

endmodule
