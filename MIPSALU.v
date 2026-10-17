// Implementacion compatible con los codigos OP de la actividad.
// Sustituir por la ALUMIPS original de clase si el profesor lo requiere.
module MIPSALU (
    input [3:0] ALUctl,
    input [31:0] A, B,
    output reg [31:0] ALUOut,
    output Zero
);
    always @(*) begin
        case (ALUctl)
            4'b0010: ALUOut = A + B;
            4'b0110: ALUOut = A - B;
            4'b0111: ALUOut = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0;
            default: ALUOut = 32'd0;
        endcase
    end
    assign Zero = (ALUOut == 32'd0);
endmodule
