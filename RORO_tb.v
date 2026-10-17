`timescale 1ns/1ps
module RORO_tb;
    reg [11:0] instruccion;
    wire [31:0] resultado;
    wire ZF;
    integer errors;
    RORO dut (.instruccion(instruccion), .resultado(resultado), .ZF(ZF));
    task check;
        input [3:0] op, r1, r2;
        input [31:0] expected;
        begin
            instruccion = {op,r1,r2};
            #10;
            if (resultado === expected && ZF === (expected == 0))
                $display("PASS RORO OP=%b R1=%d R2=%d DD=%h ZF=%b",op,r1,r2,resultado,ZF);
            else begin
                $display("FAIL RORO OP=%b R1=%d R2=%d DD=%h esperado=%h ZF=%b",op,r1,r2,resultado,expected,ZF);
                errors = errors + 1;
            end
        end
    endtask
    initial begin
        errors = 0;
        check(4'd2,4'd0,4'd0,32'd17);
        check(4'd6,4'd6,4'd6,32'd0);
        check(4'd6,4'd9,4'd9,32'hffffffd7);
        check(4'd7,4'd14,4'd14,32'd1);
        if(errors == 0) $display("RORO_tb: TODOS PASS");
        else $display("RORO_tb: %0d ERRORES",errors);
        $finish;
    end
endmodule
