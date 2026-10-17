module ROM #(parameter FILENAME = "ROMa_init.txt") (
    input [3:0] DirL,
    output [31:0] Data
);
    reg [31:0] srom [0:15];
    initial $readmemb(FILENAME, srom);
    assign Data = srom[DirL];
endmodule
