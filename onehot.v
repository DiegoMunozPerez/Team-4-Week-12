module  one_hot(

input w,
input clk,
input reset,
output z,
output Ast ,Bst, Cst, Dst, Est

);

    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;
    
    assign Ast = Astate;
    assign Bst = Bstate;
    assign Cst = Cstate;
    assign Dst = Dstate;
    assign Est = Estate;
    
    dff Adff(
    
    .Default(1'b1),
    .D(Anext),
    .clk(clk),
    .Q(Astate),
    .reset(reset)
    
    );
    
    dff Bdff(
    
    .Default(1'b0),
    .D(Bnext),
    .clk(clk),
    .Q(Bstate),
    .reset(reset)
    
    );
    
    dff Cdff(
    
    .Default(1'b0),
    .D(Cnext),
    .clk(clk),
    .Q(Cstate),
    .reset(reset)
    
    );
    
    dff Ddff(
    
    .Default(1'b0),
    .D(Dnext),
    .clk(clk),
    .Q(Dstate),
    .reset(reset)
    
    );
    
    dff Edff(
    
    .Default(1'b0),
    .D(Enext),
    .clk(clk),
    .Q(Estate),
    .reset(reset)
    
    );
    
    assign z = Cstate | Estate;
    
    assign Bnext = (~w & Astate) | (~w & Dstate) | (~w & Estate);
    assign Cnext = (~w & Cstate) | (~w & Bstate);
    assign Dnext = (w & Astate) | (w & Bstate) | (w & Cstate);
    assign Enext = (w & Dstate) | (w & Estate);

endmodule