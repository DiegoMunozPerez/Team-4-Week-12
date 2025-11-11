module binary(
    input w,
    input clk,
    input reset,
    output [2:0] St,
    output z
    
);

    wire [2:0] State;
    wire [2:0] Next;
    assign St = State;
    
    dff zero(
    
    .D(Next[0]),
    .clk(clk),
    .Q(State[0]),
    .Default(1'b0),
    .reset(reset)
    
    );
     dff one(
    
    .D(Next[1]),
    .clk(clk),
    .Q(State[1]),
    .Default(1'b0),
    .reset(reset)
    
    );
     dff two(
    
    .D(Next[2]),
    .clk(clk),
    .Q(State[2]),
    .Default(1'b0),
    .reset(reset)
    
    );
    
  
    
    assign z = (~State[0] & State[1] & ~State[2]) | (~State[0] & ~State[1] & State[2]);
    assign Next[0] = (~State[1] & ~State[0] & ~w) | (~State[2] & ~State[0] & w) | (~State[2] & ~State[1] & w) | ( State[1] & State[0] & ~w);
    assign Next[1] = (~State[2] & ~State[0] & w) | (State[1] & ~State[0]) | (State[0] & ~State[1]);
    assign Next[2] = (State[0] & w & ~State[2] & State[1]) |(~State[0] & w & State[2] & ~State[1]);
    
    
    
    
endmodule