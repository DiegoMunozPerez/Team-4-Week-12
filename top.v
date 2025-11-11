module top(
    input [0:0] sw, // w
    output [9:0] led, // see IO table
    input btnC, // clk
    input btnU // reset
);

    binary utt(
    
    .w(sw[0]),
    .clk(btnC),
    .reset(btnU),
    .z(led[1]),
    .St(led[9:7])
  
    );
    
    one_hot ut(
    
    .w(sw[0]),
    .clk(btnC),
    .reset(btnU),
    .z(led[0]),
    .Ast(led[2]),
    .Bst(led[3]),
    .Cst(led[4]),
    .Dst(led[5]),
    .Est(led[6])
    
    );
    
    
    
    
    
    
    
    

endmodule