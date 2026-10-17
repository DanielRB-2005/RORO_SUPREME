module RORO_Supreme (
    input [3:0] addr,
    output [31:0] DD,
    output ZF
);
    wire [11:0] instruccion_wire;
    ROM_Instrucciones rom_inst (
        .addr(addr), .instruccion(instruccion_wire)
    );
    RORO roro_unit (
        .instruccion(instruccion_wire), .resultado(DD), .ZF(ZF)
    );
endmodule
