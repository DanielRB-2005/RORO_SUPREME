module ROM_Instrucciones (
    input [3:0] addr,
    output [11:0] instruccion
);
    reg [11:0] mem [0:15];
    initial $readmemb("instrucciones.txt", mem);
    assign instruccion = mem[addr];
endmodule
