`include "shiftrows.v"
`include "mixcolumns.v"
`include "sub.v"
`include "addroundkey.v"
`include "keyshecdule.v"

module aes(stateout,keyout,keyin,statein,clk);
input[127:0] statein;
input[127:0] keyin;
input clk;
output[127:0] stateout,keyout;
wire[127:0] state1,state2,state3,state4,state5,state6,state7,state8,state9;
wire[127:0] key1,key2,key3,key4,key5,key6,key7,key8,key9;
wire[127:0] statein1;

assign statein1 = statein^keyin;

round r1(state1,key1,keyin,statein1,4'h1,clk);
round r2(state2,key2,key1,state1,4'h2,clk);
round r3(state3,key3,key2,state2,4'h3,clk);
round r4(state4,key4,key3,state3,4'h4,clk);
round r5(state5,key5,key4,state4,4'h5,clk);
round r6(state6,key6,key5,state5,4'h6,clk);
round r7(state7,key7,key6,state6,4'h7,clk);
round r8(state8,key8,key7,state7,4'h8,clk);
round r9(state9,key9,key8,state8,4'h9,clk);
lastround l(stateout,keyout,key9,state9,4'ha,clk);

endmodule


module round(stateout,keyout,keyin,statein,rc,clk);
input[127:0] keyin,statein;
input[3:0] rc;
input clk;
output[127:0] stateout,keyout;
wire[127:0] stateaftersub,stateaftermix,stateaftershift;

sub s(stateaftersub,statein);
shiftrows sr(stateaftershift,stateaftersub);
mixcolumns mx(stateaftermix,stateaftershift);
keyshecdule sh(keyout,keyin,rc);
addroundkey ad(stateout,keyout,stateaftermix);

endmodule


module lastround(stateout,keyout,keyin,statein,rc,clk);
input[127:0] keyin,statein;
input[3:0] rc;
input clk;
output[127:0] stateout,keyout;
wire[127:0] stateaftersub,stateaftersr;

sub s1(stateaftersub,statein);
shiftrows sr(stateaftersr,stateaftersub);
keyshecdule ks(keyout,keyin,rc);
addroundkey add(stateout,keyout,stateaftersr);

endmodule