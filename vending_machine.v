module vending_machine(clk,rst,in,out,change);
  input clk, rst;
  input [1:0]in;
  output reg out;
  output reg[1:0] change;
  
  parameters s0 =2'b00;
  parameters s1 =2'b01;
  parameters s2 =2'b10;

  reg[1:0] c_state, n_state;

  always@ (posedge clk)
  begin
    if(rst == 1)
    begin
      c_state = 0;
      n_state = 0;
      change = 2'b00;
    end
  else
    c_state = n_state;
case(c_state)
  s0: if(in == 0)
    begin
      n_state = s0;
      out = 0;
      change = 2'b00;
    end
  else if(in == 2'b01)
    begin
      n_state = s1;
      out = 0;
      change = 2'b00;
    end
  else if(in == 2'b10)
    begin
      n_state = s2;
      out = 0;
      change = 2'b00;
    end

  s1: 
    if(in == 0)
      begin
        n_state = s0;
        out = 0;
        change = 2'b01;
      end
    else if(in == 2'b01)
      begin
        n_state = s2;
        out = 0;
        change = 2'b00;
      end
    else if(in == 2'b10)
      begin
        n_state = s2;
        out = 0;
        change = 2'b00;
      end

  s2:
    if(in == 0)
      begin
        n_state = s0;
        out = 0;
        change = 2'b10;
      end
    else if(in == 2'b01)
      begin
        n_state = s0;
        out = 1;
        change = 2'b00;
      end
      else if(in == 2'b10)
       begin
        n_state = s0; 
        out = 1;
        change = 2'b01;
      end
    endcase
  end
endmodule