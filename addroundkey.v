module addroundkey(stateafteradding,key,state);
input[127:0] key,state;
output[127:0] stateafteradding;

assign stateafteradding[127:0] = key[127:0]^state[127:0];

endmodule