// Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
// Component : MyTopLevel
// Git hash  : 083ee4ef38af09f5aef273b32a445d8fe654133c

`timescale 1ns/1ps

module MyTopLevel (
  input               io_axi_aw_valid,
  output reg          io_axi_aw_ready,
  input      [2:0]    io_axi_aw_payload_addr,
  input      [2:0]    io_axi_aw_payload_prot,
  input               io_axi_w_valid,
  output reg          io_axi_w_ready,
  input      [31:0]   io_axi_w_payload_data,
  input      [3:0]    io_axi_w_payload_strb,
  output              io_axi_b_valid,
  input               io_axi_b_ready,
  output     [1:0]    io_axi_b_payload_resp,
  input               io_axi_ar_valid,
  output reg          io_axi_ar_ready,
  input      [2:0]    io_axi_ar_payload_addr,
  input      [2:0]    io_axi_ar_payload_prot,
  output              io_axi_r_valid,
  input               io_axi_r_ready,
  output     [31:0]   io_axi_r_payload_data,
  output     [1:0]    io_axi_r_payload_resp,
  output              io_enable,
  input               clk,
  input               reset
);

  wire       [3:0]    busif_wstrb;
  reg        [31:0]   busif_wmask;
  reg        [31:0]   busif_wmaskn;
  reg                 busif_readError;
  reg        [31:0]   busif_readData;
  wire                busif_axiAr_valid;
  wire                busif_axiAr_ready;
  wire       [2:0]    busif_axiAr_payload_addr;
  wire       [2:0]    busif_axiAr_payload_prot;
  reg                 io_axi_ar_rValid;
  reg        [2:0]    io_axi_ar_rData_addr;
  reg        [2:0]    io_axi_ar_rData_prot;
  wire                when_Stream_l369;
  wire                busif_axiR_valid;
  wire                busif_axiR_ready;
  wire       [31:0]   busif_axiR_payload_data;
  reg        [1:0]    busif_axiR_payload_resp;
  reg                 busif_axiRValid;
  wire                busif_axiAw_valid;
  wire                busif_axiAw_ready;
  wire       [2:0]    busif_axiAw_payload_addr;
  wire       [2:0]    busif_axiAw_payload_prot;
  reg                 io_axi_aw_rValid;
  reg        [2:0]    io_axi_aw_rData_addr;
  reg        [2:0]    io_axi_aw_rData_prot;
  wire                when_Stream_l369_1;
  wire                busif_axiW_valid;
  wire                busif_axiW_ready;
  wire       [31:0]   busif_axiW_payload_data;
  wire       [3:0]    busif_axiW_payload_strb;
  reg                 io_axi_w_rValid;
  reg        [31:0]   io_axi_w_rData_data;
  reg        [3:0]    io_axi_w_rData_strb;
  wire                when_Stream_l369_2;
  wire                busif_axiB_valid;
  wire                busif_axiB_ready;
  wire       [1:0]    busif_axiB_payload_resp;
  reg                 busif_axiBValid;
  wire                busif_askWrite;
  wire                busif_askRead;
  wire                busif_doWrite;
  wire                busif_doRead;
  wire                read_hit_0x0000;
  wire                write_hit_0x0000;
  wire       [3:0]    rev_num;
  wire       [27:0]   part_num;
  wire                read_hit_0x0004;
  wire                write_hit_0x0004;
  reg                 enable;
  wire                when_RegInst_l644;
  wire       [2:0]    switch_BusIfBase_l353;

  always @(*) begin
    io_axi_ar_ready = busif_axiAr_ready;
    if(when_Stream_l369) begin
      io_axi_ar_ready = 1'b1;
    end
  end

  assign when_Stream_l369 = (! busif_axiAr_valid);
  assign busif_axiAr_valid = io_axi_ar_rValid;
  assign busif_axiAr_payload_addr = io_axi_ar_rData_addr;
  assign busif_axiAr_payload_prot = io_axi_ar_rData_prot;
  always @(*) begin
    io_axi_aw_ready = busif_axiAw_ready;
    if(when_Stream_l369_1) begin
      io_axi_aw_ready = 1'b1;
    end
  end

  assign when_Stream_l369_1 = (! busif_axiAw_valid);
  assign busif_axiAw_valid = io_axi_aw_rValid;
  assign busif_axiAw_payload_addr = io_axi_aw_rData_addr;
  assign busif_axiAw_payload_prot = io_axi_aw_rData_prot;
  always @(*) begin
    io_axi_w_ready = busif_axiW_ready;
    if(when_Stream_l369_2) begin
      io_axi_w_ready = 1'b1;
    end
  end

  assign when_Stream_l369_2 = (! busif_axiW_valid);
  assign busif_axiW_valid = io_axi_w_rValid;
  assign busif_axiW_payload_data = io_axi_w_rData_data;
  assign busif_axiW_payload_strb = io_axi_w_rData_strb;
  assign busif_wstrb = (busif_axiAr_valid ? 4'b1111 : busif_axiW_payload_strb);
  always @(*) begin
    busif_wmask[7 : 0] = (busif_wstrb[0] ? 8'hff : 8'h00);
    busif_wmask[15 : 8] = (busif_wstrb[1] ? 8'hff : 8'h00);
    busif_wmask[23 : 16] = (busif_wstrb[2] ? 8'hff : 8'h00);
    busif_wmask[31 : 24] = (busif_wstrb[3] ? 8'hff : 8'h00);
  end

  always @(*) begin
    busif_wmaskn[7 : 0] = (busif_wstrb[0] ? 8'h00 : 8'hff);
    busif_wmaskn[15 : 8] = (busif_wstrb[1] ? 8'h00 : 8'hff);
    busif_wmaskn[23 : 16] = (busif_wstrb[2] ? 8'h00 : 8'hff);
    busif_wmaskn[31 : 24] = (busif_wstrb[3] ? 8'h00 : 8'hff);
  end

  always @(*) begin
    if(busif_readError) begin
      busif_axiR_payload_resp = 2'b10;
    end else begin
      busif_axiR_payload_resp = 2'b00;
    end
  end

  assign busif_axiR_valid = busif_axiRValid;
  assign busif_axiR_payload_data = busif_readData;
  assign busif_axiB_payload_resp = 2'b00;
  assign busif_axiB_valid = busif_axiBValid;
  assign io_axi_r_valid = busif_axiR_valid;
  assign busif_axiR_ready = io_axi_r_ready;
  assign io_axi_r_payload_data = busif_axiR_payload_data;
  assign io_axi_r_payload_resp = busif_axiR_payload_resp;
  assign io_axi_b_valid = busif_axiB_valid;
  assign busif_axiB_ready = io_axi_b_ready;
  assign io_axi_b_payload_resp = busif_axiB_payload_resp;
  assign busif_askWrite = (busif_axiAw_valid && busif_axiW_valid);
  assign busif_askRead = (busif_axiAr_valid || (busif_axiR_valid && (! busif_axiR_ready)));
  assign busif_doWrite = (busif_askWrite && ((! busif_axiB_valid) || busif_axiB_ready));
  assign busif_doRead = (busif_axiAr_valid && ((! busif_axiR_valid) || busif_axiR_ready));
  assign busif_axiAr_ready = busif_doRead;
  assign busif_axiAw_ready = busif_doWrite;
  assign busif_axiW_ready = busif_doWrite;
  assign read_hit_0x0000 = (({busif_axiAr_payload_addr[2 : 2],2'b00} == 3'b000) && busif_doRead);
  assign write_hit_0x0000 = ((busif_axiAw_payload_addr == 3'b000) && busif_doWrite);
  assign rev_num = 4'b0001;
  assign part_num = 28'h1234567;
  assign read_hit_0x0004 = (({busif_axiAr_payload_addr[2 : 2],2'b00} == 3'b100) && busif_doRead);
  assign write_hit_0x0004 = ((busif_axiAw_payload_addr == 3'b100) && busif_doWrite);
  assign when_RegInst_l644 = (busif_axiW_payload_data[0] && busif_wmask[0]);
  assign io_enable = enable;
  assign switch_BusIfBase_l353 = {busif_axiAr_payload_addr[2 : 2],2'b00};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      busif_readError <= 1'b0;
      busif_readData <= 32'h00000000;
      io_axi_ar_rValid <= 1'b0;
      busif_axiRValid <= 1'b0;
      io_axi_aw_rValid <= 1'b0;
      io_axi_w_rValid <= 1'b0;
      busif_axiBValid <= 1'b0;
      enable <= 1'b0;
    end else begin
      if(io_axi_ar_ready) begin
        io_axi_ar_rValid <= io_axi_ar_valid;
      end
      if(io_axi_aw_ready) begin
        io_axi_aw_rValid <= io_axi_aw_valid;
      end
      if(io_axi_w_ready) begin
        io_axi_w_rValid <= io_axi_w_valid;
      end
      if(busif_axiR_ready) begin
        busif_axiRValid <= 1'b0;
      end
      if(busif_doRead) begin
        busif_axiRValid <= 1'b1;
      end
      if(busif_axiB_ready) begin
        busif_axiBValid <= 1'b0;
      end
      if(busif_doWrite) begin
        busif_axiBValid <= 1'b1;
      end
      if(write_hit_0x0004) begin
        if(when_RegInst_l644) begin
          enable <= ((enable && busif_wmaskn[0]) || ((! enable) && busif_wmask[0]));
        end
      end
      if(busif_askRead) begin
        case(switch_BusIfBase_l353)
          3'b000 : begin
            busif_readData <= {part_num,rev_num};
            busif_readError <= 1'b0;
          end
          3'b100 : begin
            busif_readData <= {31'h00000000,enable};
            busif_readError <= 1'b0;
          end
          default : begin
            busif_readData <= 32'h00000000;
            busif_readError <= 1'b0;
          end
        endcase
      end else begin
        busif_readData <= 32'h00000000;
        busif_readError <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    if(io_axi_ar_ready) begin
      io_axi_ar_rData_addr <= io_axi_ar_payload_addr;
      io_axi_ar_rData_prot <= io_axi_ar_payload_prot;
    end
    if(io_axi_aw_ready) begin
      io_axi_aw_rData_addr <= io_axi_aw_payload_addr;
      io_axi_aw_rData_prot <= io_axi_aw_payload_prot;
    end
    if(io_axi_w_ready) begin
      io_axi_w_rData_data <= io_axi_w_payload_data;
      io_axi_w_rData_strb <= io_axi_w_payload_strb;
    end
  end


endmodule
