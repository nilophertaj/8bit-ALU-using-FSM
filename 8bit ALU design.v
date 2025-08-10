module mult(input[7:0]ain,bin,
       input clk,rst,s,
       output[31:0]out);
 
  reg [31:0]out;
  reg[7:0]a,b;
  reg[1:0]pstate,nstate;
  parameter t0=2'b00,t1=2'b01,t2=2'b10,t3=2'b11;
  always@(posedge clk or negedge rst)
    if(!rst)begin pstate=t0;a=0;b=0;end
  
  else begin pstate<=nstate;
    a<=ain; b<= bin;end
  
  always@(s or pstate)
    case(pstate)
      t0:if(s)nstate=t1;else nstate=t0;
      t1:if(s)nstate=t2;else nstate=t1;
      t2:if(s)nstate=t3;else nstate=t2;
      t3:if(s)nstate=t0;else nstate=t3;
      
    endcase
  always@(*)begin
    case(pstate)
     
      t0:  begin out=ain+bin;end
      t1:begin  out=ain-bin;end
      t2:begin  out=ain*bin;end
      t3:begin  out=ain%bin;end
      default: out = 0;
    endcase
  end
  
endmodule