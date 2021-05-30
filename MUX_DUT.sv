module mux_DUT(mux_if.DUT intf);


assign intf.Y=intf.s[1]?(intf.s[0]?intf.A[3]:intf.A[2]):(intf.s[0]?intf.A[1]:intf.A[0]);

endmodule
