interface mux_if();

logic [3:0]A;
logic [1:0]s;
logic Y;

modport DUT(input A,s, output Y);
endinterface