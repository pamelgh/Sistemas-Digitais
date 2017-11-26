module area(
    input [11:0]x1,
    input [11:0]y1,
    
    input [11:0]x2,
    input [11:0]y2,

    input [11:0]x3,
    input [11:0]y3,
    
    output [21:0] ex
);

    reg [21:0] Area = 0;
    assign ex = Area;



    wire [11:0] Suby23;       
    wire [11:0] Suby31;       
    wire [11:0] Suby12;       
    
    wire [21:0] multx1, multx2, multx3, Add;   
    wire signed [21:0] Dv;         
    
    assign Suby23 = (y2 - y3);
    assign Suby31 = (y3 - y1);
    assign Suby12 = (y1 - y2);
    
    assign multx1 = (x1 * Suby23);
    assign multx2 = (x2 * Suby31);
    assign multx3 = (x3 * Suby12);
    
    assign Add = (Mx1 + Mx2 + Mx3);

    assign Dv = (Add/2);

    always @(x1 or y1 or x2 or y2 or x3 or y3) begin
        area = $abs(Div);           //valor absoluto
    end  
endmodule


module Inside_or_Outside(
    input [11:0]x1,
    input [11:0]y1,
    
    input [11:0]x2,
    input [11:0]y2,  

    input [11:0]x3,
    input [11:0]y3,

    input [11:0]x,
    input [11:0]y,

    output inside
);
    
    wire signed[21:0] s, s1, s2, s3;

    Area a(x1, y1, x2, y2, x3, y3, s);  //triangulo principal
    Area a1(x, y, x2, y2, x3, y3, s1);
    Area a2(x1, y1, x, y, x3, y3, s2);
    Area a3(x1, y1, x2, y2, x, y, s3);

    assign inside = ( s >= (s1 + s2 +s3) ) ? 1 : 0;
endmodule


module testbench;
    reg signed [11:0] x1;
    reg signed [11:0] y1;
    reg signed [11:0] x2;
    reg signed [11:0] y2;
    reg signed [11:0] x3;
    reg signed [11:0] y3;

    reg signed [11:0] x;
    reg signed [11:0] y;

    wire resul;

    Inside_or_Outside( x1, y1, x2, y2, x3, y3, x, y, resul);

    initial begin
        x1 <= 10;
        y1 <= 10;
        x2 <= 5;
        y2 <= 30;
        x3 <= 15;
        y3 <= 25;
        x <= 5;
        y <= 10;

        #2 
        $display("\nnCoord. escolhidas: %d %d  Triangulo: %d %d  %d %d  %d %d\nDentro? %d", x, y, x1, y1, x2, y2, x3, y3, resul);
        #2

        x <= 0;

        #2 
        $display("\nCoord. escolhidas: %d %d  Triangulo: %d %d  %d %d  %d %d\nDentro? %d", x, y, x1, y1, x2, y2, x3, y3, resul);
        #2

        x3 <= 25;
        y3 <= 25;
        x <= 0;
        y <= 0;

        #2 
        $display("\nCoord. escolhidas: %d %d  Triangulo: %d %d  %d %d  %d %d\nDentro? %d", x, y, x1, y1, x2, y2, x3, y3, resul);
        #2

        #40
        $finish;
    end 
endmodule
