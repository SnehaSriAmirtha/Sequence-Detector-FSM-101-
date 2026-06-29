// Code your design here
module moore_101_overlap (
    input  wire clk,
    input  wire reset,
    input  wire in,
    output reg  out
);

    
typedef enum reg [1:0] {
        S0 = 2'b00,  
        S1 = 2'b01,  
        S2 = 2'b10,  
        S3 = 2'b11   
    } state_t;

  state_t current_state, next_state;

   
  always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

   
  always @(*) begin
        case (current_state)
            S0: begin
                if (in) next_state = S1;  
                else    next_state = S0;  
            end

            S1: begin
                if (in) next_state = S1;  
                else    next_state = S2;   
            end

            S2: begin
                if (in) next_state = S3;  
                else    next_state = S0;   
            end

            S3: begin
                if (in) next_state = S1;  
                else    next_state = S2;  
            end

            default: next_state = S0;
        endcase
   end

    
   always @(*) begin
        case (current_state)
            S3: out = 1'b1;  
            default: out = 1'b0;
        endcase
   end

endmodule
