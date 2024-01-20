interface router_if(input bit clock);

logic [7:0] data_in;
logic [7:0] data_out;
logic resetn;
logic err;
logic busy;
logic read_enb;
logic vld_out;
logic pkt_valid;

//write driver clocking block
clocking write_driver_cb @ (posedge clock);
   default input #1 output #1;
   output data_in;
   output pkt_valid;
   output resetn;
   input err;
   input busy;
endclocking

//read driver clocking block
clocking read_driver_cb @(posedge clock);
   default input #1 output #1;
   output read_enb;
   input vld_out;
endclocking

//write driver MP
modport WDR_MP (clocking write_driver_cb);

//read driver MP
modport RDR_MP (clocking read_driver_cb);

//write monitor clocking block
clocking write_monitor_cb
 @(posedge clock);
   default input #1 output #1;
   input data_in;
   input pkt_valid;
   input err;
   input busy;
   input resetn;
endclocking

//read monitor clocking block
clocking read_monitor_cb @(posedge clock);
   default input #1 output #1;
   input data_out;
   input read_enb;
endclocking

//write monitor MP
modport WMON_MP (clocking write_monitor_cb);

//read monitor MP
modport RMON_MP (clocking read_monitor_cb);

endinterface
~
~
~
