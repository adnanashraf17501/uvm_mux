import uvm_pkg::*;
`include "uvm_macros.svh"
`include "MUX_Interface.sv"
`include "MUX_DUT.sv"
`include "Mux_Seq_Item.sv"
`include "Mux_Seq.sv"
`include "Mux_Secr.sv"
`include "MUX_Driver.sv"
`include "MUX_MON1.sv"
`include "MUX_MON2.sv"
`include "MUX_Agent1.sv"
`include "MUX_agent2.sv"
`include "MUX_SB.sv"
`include "MUX_ENV.sv"
`include "MUX_Test.sv"

module mux_top();

mux_if intf();
mux_DUT V_code(intf);

initial
begin
  uvm_config_db #(virtual mux_if)::set(uvm_root::get(),"*","intf",intf);
run_test("mux_test");
end
endmodule
