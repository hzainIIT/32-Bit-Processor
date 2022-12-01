`timescale 1ns/10ps
module ALU_C_tb;
    reg        clk;
    reg [1:0]  ALU_Op; 
    reg [5:0]  funct_field;
    wire [3:0] ALU_control; 
    localparam period =10;
    always #(period/2) clk=~clk;
    initial begin
        clk         <=0;
        ALU_Op      <= 2'b00;
        funct_field <= 6'bxxxxxx;
        #(period-1)
        ALU_Op      <= 2'b01; 
        #period
        ALU_Op      <= 2'b10;
        funct_field <= 6'b100000; // ADD
        #period
        funct_field <= 6'b100010; // SUBTRACT
        #period
        funct_field <= 6'b100100; // AND
        #period
        funct_field <= 6'b100101; // OR
        #period
        funct_field <= 6'b101010; // Set-on-less-than
    end
    // ALU_control UUT(.clk(clk),.ALU_Op(ALU_Op),.funct_field(funct_field),.ALU_control(ALU_control));
endmodule 
/*
Below is the testbench for the ALU which has a task but also prints out the correct 
answers which should be expected for verification
*/
module ALU_32_tb;
    parameter AND_ = 4'b000000, OR_ = 4'b000001, ADD_ = 4'b000010, SUB_ = 4'b000110, SLT_ = 4'b000111, NOR_ = 4'b001100;
    reg [5:0]  ALU_C = 0;
    reg [31:0] a, b, c, d =0;
    wire zero,ov;
    wire [31:0] res;
    initial begin
        cycle_through(32'h11111111, 32'h22222222);
        #10
        cycle_through(32'hBEEFFEEB, 32'hDEADDEAD);
    end
    // Task were created for this redundant operation
    task cycle_through;
        input [31:0] a_i, b_i;
        begin
            ALU_C <= ADD_;
            a    = a_i;
            b    = b_i;
            c    = a+b;
            $display("A: 0x%h , B: 0x%h",a,b);
            $display("ADD: The Result should be 0x%h", c);
            #10
            ALU_C <= SUB_;
            c = a-b;
            $display("SUB: The Result should be %h", c);
            #10
            ALU_C <= SLT_;
            if(a[31]==b[31])begin
                if(a > b)begin
                    c = 0;
                end
                else begin
                    c = 1;
                end
            end
            else begin
                if(a[31] > b[31])begin
                    c = 1;
                end else begin
                    c = 0;
                end
            end
            $display("SLT: The Result should be %h", c);
            #10
            ALU_C <= AND_;
            c = a&b;
            $display("AND: The Result should be %h", c);
            #10
            ALU_C <= OR_;
            c = a|b;
            $display("OR: The Result should be %h", c);
            #10
            ALU_C <= NOR_;
            c = ~(a|b);
            $display("NOR: The Result should be %h", c);       
        end
    endtask
    ALU UUT(.ALUCont(ALU_C),.A(a),.B(b),.zero(zero),.ovf(ov),.ALUResult(res));
endmodule