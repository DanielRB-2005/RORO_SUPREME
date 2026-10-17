`timescale 1ns/1ps
module RORO_Supreme_tb;
    reg [3:0] addr;
    wire [31:0] DD;
    wire ZF;
    reg [31:0] expected [0:15];
    integer i, errors;
    RORO_Supreme dut (.addr(addr), .DD(DD), .ZF(ZF));
    initial begin
        expected[0]=17; expected[1]=21; expected[2]=35; expected[3]=12;
        expected[4]=60; expected[5]=48; expected[6]=0; expected[7]=9;
        expected[8]=51; expected[9]=32'hffffffd7; expected[10]=97;
        expected[11]=0; expected[12]=0; expected[13]=0;
        expected[14]=1; expected[15]=0;
        errors=0;
        $display("INICIO PRUEBAS RORO SUPREME");
        for(i=0;i<16;i=i+1) begin
            addr=i;
            #10;
            if(DD === expected[i] && ZF === (expected[i] == 0))
                $display("PASS dir=%0d DD=%h ZF=%b",i,DD,ZF);
            else begin
                $display("FAIL dir=%0d DD=%h esperado=%h ZF=%b",i,DD,expected[i],ZF);
                errors=errors+1;
            end
        end
        if(errors==0) $display("RESULTADO: 16/16 PASS");
        else $display("RESULTADO: %0d FALLAS",errors);
        $finish;
    end
endmodule
