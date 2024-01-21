// Extend ram_rd_sequencer from uvm_sequencer parameterized by read_xtn
        class rd_sequencer extends uvm_sequencer #(read_xtn);

// Factory registration using `uvm_component_utils
        `uvm_component_utils(rd_sequencer)

//------------------------------------------
// METHODS
//------------------------------------------

// Standard UVM Methods:
        extern function new(string name = "rd_sequencer",uvm_component parent);
        endclass
//-----------------  constructor new method  -------------------//
        function rd_sequencer::new(string name="rd_sequencer",uvm_component parent);
                super.new(name,parent);
        endfunction
