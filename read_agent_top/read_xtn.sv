// Extend read_xtn from uvm_sequence_item
  class read_xtn extends uvm_sequence_item;

// UVM Factory Registration Macro
        `uvm_object_utils(read_xtn)

bit[7:0] header;
bit[7:0] payload[];
bit[7:0] parity;

rand bit[4:0] no_of_clocks;

extern function new(string name = "read_xtn");

extern function void do_print(uvm_printer printer);

endclass:read_xtn


function read_xtn::new(string name = "read_xtn");
        super.new(name);
endfunction:new


  function void  read_xtn::do_print (uvm_printer printer);
    super.do_print(printer);


    //                     srting name                          bitstream value     size       radix for printing
    printer.print_field(     "header",                   this.header,                8,          UVM_DEC                );
    payload= new[header[7:2]];
    foreach(payload[i])
    printer.print_field( $sformatf("payload[%0d]",i) ,  this.payload[i],             8,          UVM_DEC                );
    printer.print_field(      "parity",                 this.parity,                 8,          UVM_DEC                );
     printer.print_field( "no_of_clocks",               this.no_of_clocks,           8,          UVM_DEC                );

  endfunction:do_print

