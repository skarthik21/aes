`include "sub_table.v"


module sub(stateaftersub,state);
input[127:0] state;
output[127:0] stateaftersub;

sub_table s1(stateaftersub[127:120],state[127:120]);
sub_table s2(stateaftersub[119:112],state[119:112]);
sub_table s3(stateaftersub[111:104],state[111:104]);
sub_table s4(stateaftersub[103:96],state[103:96]);



sub_table s5(stateaftersub[95:88],state[95:88]);
sub_table s6(stateaftersub[87:80],state[87:80]);
sub_table s7(stateaftersub[79:72],state[79:72]);
sub_table s8(stateaftersub[71:64],state[71:64]);



sub_table s9(stateaftersub[63:56],state[63:56]);
sub_table s10(stateaftersub[55:48],state[55:48]);
sub_table s11(stateaftersub[47:40],state[47:40]);
sub_table s12(stateaftersub[39:32],state[39:32]);



sub_table s13(stateaftersub[31:24],state[31:24]);
sub_table s14(stateaftersub[23:16],state[23:16]);
sub_table s15(stateaftersub[15:8],state[15:8]);
sub_table s16(stateaftersub[7:0],state[7:0]);


endmodule


