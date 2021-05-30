class mux_driver extends uvm_driver #(mux_seq_item);
`uvm_component_utils(mux_driver)

mux_seq_item pkt;
virtual mux_if intf;

function new(string name="mux_driver", uvm_component parent);
super.new(name, parent);
endfunction

virtual function void build_phase(uvm_phase phase);
  super.build_phase(phase);
  uvm_config_db #(virtual mux_if)::get(this,"","intf",intf);
endfunction

task run_phase(uvm_phase phase);
   
  pkt=mux_seq_item::type_id::create("pkt");
 forever
   begin
  seq_item_port.get_next_item(pkt);
  #5
  intf.A=pkt.A;
  intf.s=pkt.s;
  
  `uvm_info("DRV Transaction", $sformatf("A=%b,S=%b", intf.A,intf.s),UVM_NONE);
  seq_item_port.item_done();
end
endtask
endclass
