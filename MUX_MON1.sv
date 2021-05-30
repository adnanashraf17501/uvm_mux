class mux_MON1 extends uvm_monitor;

`uvm_component_utils(mux_MON1)

mux_seq_item pkt;

virtual mux_if intf;


uvm_analysis_port #(mux_seq_item) MON12SB;

function new(string name="mux_MON1", uvm_component parent);
super.new(name, parent);
MON12SB=new("MON12SB",this);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);

uvm_config_db #(virtual mux_if)::get(this,"", "intf", intf);
endfunction

task run_phase(uvm_phase phase);
  
  pkt=mux_seq_item::type_id::create("pkt");
  forever
  begin
    #5
    pkt.A=intf.A;
    pkt.s=intf.s;
    
    `uvm_info("MON1", $sformatf("A=%b, s=%b", pkt.A, pkt.s),UVM_NONE);
    MON12SB.write(pkt);
  end
endtask
endclass
    
