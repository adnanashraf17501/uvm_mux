class mux_sb extends uvm_scoreboard;
`uvm_component_utils(mux_sb)

mux_seq_item pkt1, pkt2;

uvm_tlm_analysis_fifo #(mux_seq_item) ip_fifo;
uvm_tlm_analysis_fifo #(mux_seq_item) op_fifo;

function new(string name="mux_sb", uvm_component parent);
  super.new(name, parent);
  ip_fifo=new("ip_fifo", this);
  op_fifo=new("op_fifo", this);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  pkt1=mux_seq_item::type_id::create("pkt1",this);
  pkt2=mux_seq_item::type_id::create("pkt2",this);
endfunction

task run_phase(uvm_phase phase);
  forever
  begin
    fork
    ip_fifo.get(pkt1);
    op_fifo.get(pkt2);
    join
    
    if(pkt2.Y==(pkt1.s[1]?(pkt1.s[0]?pkt1.A[3]:pkt1.A[2]):(pkt1.s[0]?pkt1.A[1]:pkt1.A[0])))
      begin
      `uvm_info("SB Matched", $sformatf("pkt1.A=%b,pkt1.s=%b, pkt2.Y=%b",pkt1.A, pkt1.s, pkt2.Y),UVM_NONE);
     end
     else
       begin
      `uvm_info("SB Not Matched ", $sformatf("pkt1.A=%b,pkt1.s=%b, pkt2.Y=%b",pkt1.A, pkt1.s, pkt2.Y),UVM_NONE);
       end
   end
 endtask
 endclass
