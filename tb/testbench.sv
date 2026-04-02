module test;
    
    logic [7:0] a, b;
    logic [1:0] op;
    logic [7:0] result;
    
    calc4 uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );
    
    initial begin
        $dumpfile("waves/waveform.vcd");
        $dumpvars(0, test);
        
        $display("========================================");
        $display("     TESTBENCH DA CALCULADORA");
        $display("========================================");
        $display("OP: 00=SOMA | 01=SUB | 10=MULT | 11=DIV\n");
        
        // Teste 1: Soma
        a = 10; b = 5; op = 2'b00;
        #10;
        $display("SOMA: %0d + %0d = %0d", a, b, result);
        
        // Teste 2: Subtração
        a = 10; b = 3; op = 2'b01;
        #10;
        $display("SUB: %0d - %0d = %0d", a, b, result);
        
        // Teste 3: Multiplicação
        a = 7; b = 6; op = 2'b10;
        #10;
        $display("MULT: %0d x %0d = %0d", a, b, result);
        
        // Teste 4: Divisão
        a = 20; b = 4; op = 2'b11;
        #10;
        $display("DIV: %0d / %0d = %0d", a, b, result);
        
        // Teste 5: Divisão por zero
        a = 15; b = 0; op = 2'b11;
        #10;
        $display("DIV/ZERO: %0d / %0d = %0d", a, b, result);
        
        // Teste 6: Overflow
        a = 255; b = 1; op = 2'b00;
        #10;
        $display("OVERFLOW: 255 + 1 = %0d", result);
        
        $display("\n========================================");
        $display("        SIMULAÇÃO CONCLUÍDA!");
        $display("========================================");
        
        #20;
        $finish;
    end
    
endmodule
