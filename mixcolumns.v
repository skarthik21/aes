module mixcolumns(stateaftermix,state);
input[127:0] state;
output[127:0] stateaftermix;


function[7:0] mult2;
        input[7:0] a;
        reg[7:0] c;
        begin
           c = a<<1;
           case (a[7])
                   1'b1: mult2 = c^8'b00011011; 
                   default: mult2 = c;
           endcase;
        end
endfunction


assign stateaftermix[127:120] = mult2(state[127:120])^state[111:104]^state[119:112]^mult2(state[119:112])^state[103:96];
assign stateaftermix[119:112] = state[103:96]^state[111:104]^mult2(state[119:112])^mult2(state[111:104])^state[127:120];
assign stateaftermix[111:104] = state[103:96]^mult2(state[111:104])^mult2(state[103:96])^state[127:120]^state[119:112];
assign stateaftermix[103:96] = mult2(state[103:96])^mult2(state[127:120])^state[119:112]^state[127:120]^state[111:104];

assign stateaftermix[95:88] =mult2(state[95:88])^state[79:72]^state[87:80]^mult2(state[87:80])^state[71:64];
assign stateaftermix[87:80] =state[71:64]^state[79:72]^mult2(state[87:80])^mult2(state[79:72])^state[95:88];
assign stateaftermix[79:72] =state[71:64]^mult2(state[79:72])^mult2(state[71:64])^state[95:88]^state[87:80];
assign stateaftermix[71:64] =mult2(state[71:64])^mult2(state[95:88])^state[87:80]^state[95:88]^state[79:72];

assign stateaftermix[63:56] =mult2(state[63:56])^state[47:40]^state[55:48]^mult2(state[55:48])^state[39:32];
assign stateaftermix[55:48] =state[39:32]^state[47:40]^mult2(state[55:48])^mult2(state[47:40])^state[63:56];
assign stateaftermix[47:40] =state[39:32]^mult2(state[47:40])^mult2(state[39:32])^state[63:56]^state[55:48];
assign stateaftermix[39:32] =mult2(state[39:32])^mult2(state[63:56])^state[55:48]^state[63:56]^state[47:40];


assign stateaftermix[31:24] = mult2(state[31:24])^state[15:8]^state[23:16]^mult2(state[23:16])^state[7:0];
assign stateaftermix[23:16] = state[7:0]^state[15:8]^mult2(state[23:16])^mult2(state[15:8])^state[31:24];
assign stateaftermix[15:8] = state[7:0]^mult2(state[15:8])^mult2(state[7:0])^state[31:24]^state[23:16];
assign stateaftermix[7:0] = mult2(state[7:0])^mult2(state[31:24])^state[23:16]^state[31:24]^state[15:8];

endmodule
