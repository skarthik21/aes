module shiftrows(stateaftershift,state);
input[127:0] state;
output[127:0] stateaftershift;

assign stateaftershift[127:120] = state[127:120];
assign stateaftershift[119:112] = state[87:80];
assign stateaftershift[111:104] = state[47:40];
assign stateaftershift[103:96] = state[7:0];


assign stateaftershift[95:88] = state[95:88];
assign stateaftershift[87:80] = state[55:48];
assign stateaftershift[79:72] = state[15:8];
assign stateaftershift[71:64] = state[103:96];



assign stateaftershift[63:56] = state[63:56];
assign stateaftershift[55:48] = state[23:16];
assign stateaftershift[47:40] = state[111:104];
assign stateaftershift[39:32] = state[71:64];


assign stateaftershift[31:24] = state[31:24];
assign stateaftershift[23:16] = state[119:112];
assign stateaftershift[15:8] = state[79:72];
assign stateaftershift[7:0] = state[39:32];

endmodule