-- Generator : SpinalHDL v1.9.3    git head : 029104c77a54c53f1edda327a3bea333f7d65fd9
-- Component : MyTopLevel
-- Git hash  : 083ee4ef38af09f5aef273b32a445d8fe654133c

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

package pkg_enum is

end pkg_enum;

library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

package pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic;
  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector;
  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector;
  function pkg_not (value : std_logic_vector) return std_logic_vector;
  function pkg_extract (that : unsigned; bitId : integer) return std_logic;
  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned;
  function pkg_cat (a : unsigned; b : unsigned) return unsigned;
  function pkg_not (value : unsigned) return unsigned;
  function pkg_extract (that : signed; bitId : integer) return std_logic;
  function pkg_extract (that : signed; base : unsigned; size : integer) return signed;
  function pkg_cat (a : signed; b : signed) return signed;
  function pkg_not (value : signed) return signed;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic;
  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector;
  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned;
  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed;

  function pkg_toStdLogic (value : boolean) return std_logic;
  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector;
  function pkg_toUnsigned (value : std_logic) return unsigned;
  function pkg_toSigned (value : std_logic) return signed;
  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector;
  function pkg_unsigned (lit : unsigned) return unsigned;
  function pkg_signed (lit : signed) return signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector;
  function pkg_resize (that : unsigned; width : integer) return unsigned;
  function pkg_resize (that : signed; width : integer) return signed;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector;
  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned;
  function pkg_extract (that : signed; high : integer; low : integer) return signed;

  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector;
  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;

  function pkg_shiftRight (that : unsigned; size : natural) return unsigned;
  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned;
  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned;

  function pkg_shiftRight (that : signed; size : natural) return signed;
  function pkg_shiftRight (that : signed; size : unsigned) return signed;
  function pkg_shiftLeft (that : signed; size : natural) return signed;
  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector;
end  pkg_scala2hdl;

package body pkg_scala2hdl is
  function pkg_extract (that : std_logic_vector; bitId : integer) return std_logic is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : std_logic_vector; base : unsigned; size : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of std_logic_vector(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : std_logic_vector; b : std_logic_vector) return std_logic_vector is
    variable cat : std_logic_vector(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : unsigned; bitId : integer) return std_logic is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : unsigned; base : unsigned; size : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of unsigned(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : unsigned; b : unsigned) return unsigned is
    variable cat : unsigned(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : unsigned) return unsigned is
    variable ret : unsigned(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;

  function pkg_extract (that : signed; bitId : integer) return std_logic is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    if bitId >= temp'length then
      return 'U';
    end if;
    return temp(bitId);
  end pkg_extract;

  function pkg_extract (that : signed; base : unsigned; size : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;    constant elementCount : integer := temp'length - size + 1;
    type tableType is array (0 to elementCount-1) of signed(size-1 downto 0);
    variable table : tableType;
  begin
    for i in 0 to elementCount-1 loop
      table(i) := temp(i + size - 1 downto i);
    end loop;
    if base + size >= elementCount then
      return (size-1 downto 0 => 'U');
    end if;
    return table(to_integer(base));
  end pkg_extract;

  function pkg_cat (a : signed; b : signed) return signed is
    variable cat : signed(a'length + b'length-1 downto 0);
  begin
    cat := a & b;
    return cat;
  end pkg_cat;

  function pkg_not (value : signed) return signed is
    variable ret : signed(value'length-1 downto 0);
  begin
    ret := not value;
    return ret;
  end pkg_not;


  -- unsigned shifts
  function pkg_shiftRight (that : unsigned; size : natural) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    if size >= that'length then
      return "";
    else
      ret := shift_right(that,size);
      return ret(that'length-1-size downto 0);
    end if;
  end pkg_shiftRight;

  function pkg_shiftRight (that : unsigned; size : unsigned) return unsigned is
    variable ret : unsigned(that'length-1 downto 0);
  begin
    ret := shift_right(that,to_integer(size));
    return ret;
  end pkg_shiftRight;

  function pkg_shiftLeft (that : unsigned; size : natural) return unsigned is
  begin
    return shift_left(resize(that,that'length + size),size);
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : unsigned; size : unsigned) return unsigned is
  begin
    return shift_left(resize(that,that'length + 2**size'length - 1),to_integer(size));
  end pkg_shiftLeft;

  -- std_logic_vector shifts
  function pkg_shiftRight (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : std_logic_vector; size : natural) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  -- signed shifts
  function pkg_shiftRight (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftRight(unsigned(that),size));
  end pkg_shiftRight;

  function pkg_shiftRight (that : signed; size : unsigned) return signed is
  begin
    return shift_right(that,to_integer(size));
  end pkg_shiftRight;

  function pkg_shiftLeft (that : signed; size : natural) return signed is
  begin
    return signed(pkg_shiftLeft(unsigned(that),size));
  end pkg_shiftLeft;

  function pkg_shiftLeft (that : signed; size : unsigned; w : integer) return signed is
  begin
    return shift_left(resize(that,w),to_integer(size));
  end pkg_shiftLeft;

  function pkg_rotateLeft (that : std_logic_vector; size : unsigned) return std_logic_vector is
  begin
    return std_logic_vector(rotate_left(unsigned(that),to_integer(size)));
  end pkg_rotateLeft;

  function pkg_extract (that : std_logic_vector; high : integer; low : integer) return std_logic_vector is
    alias temp : std_logic_vector(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : unsigned; high : integer; low : integer) return unsigned is
    alias temp : unsigned(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_extract (that : signed; high : integer; low : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
  begin
    return temp(high downto low);
  end pkg_extract;

  function pkg_mux (sel : std_logic; one : std_logic; zero : std_logic) return std_logic is
  begin
    if sel = '1' then
      return one;
    else
      return zero;
    end if;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : std_logic_vector; zero : std_logic_vector) return std_logic_vector is
    variable ret : std_logic_vector(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : unsigned; zero : unsigned) return unsigned is
    variable ret : unsigned(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_mux (sel : std_logic; one : signed; zero : signed) return signed is
    variable ret : signed(zero'range);
  begin
    if sel = '1' then
      ret := one;
    else
      ret := zero;
    end if;
    return ret;
  end pkg_mux;

  function pkg_toStdLogic (value : boolean) return std_logic is
  begin
    if value = true then
      return '1';
    else
      return '0';
    end if;
  end pkg_toStdLogic;

  function pkg_toStdLogicVector (value : std_logic) return std_logic_vector is
    variable ret : std_logic_vector(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toStdLogicVector;

  function pkg_toUnsigned (value : std_logic) return unsigned is
    variable ret : unsigned(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toUnsigned;

  function pkg_toSigned (value : std_logic) return signed is
    variable ret : signed(0 downto 0);
  begin
    ret(0) := value;
    return ret;
  end pkg_toSigned;

  function pkg_stdLogicVector (lit : std_logic_vector) return std_logic_vector is
    alias ret : std_logic_vector(lit'length-1 downto 0) is lit;
  begin
    return std_logic_vector(ret);
  end pkg_stdLogicVector;

  function pkg_unsigned (lit : unsigned) return unsigned is
    alias ret : unsigned(lit'length-1 downto 0) is lit;
  begin
    return unsigned(ret);
  end pkg_unsigned;

  function pkg_signed (lit : signed) return signed is
    alias ret : signed(lit'length-1 downto 0) is lit;
  begin
    return signed(ret);
  end pkg_signed;

  function pkg_resize (that : std_logic_vector; width : integer) return std_logic_vector is
  begin
    return std_logic_vector(resize(unsigned(that),width));
  end pkg_resize;

  function pkg_resize (that : unsigned; width : integer) return unsigned is
    variable ret : unsigned(width-1 downto 0);
  begin
    if that'length = 0 then
       ret := (others => '0');
    else
       ret := resize(that,width);
    end if;
    return ret;
  end pkg_resize;
  function pkg_resize (that : signed; width : integer) return signed is
    alias temp : signed(that'length-1 downto 0) is that;
    variable ret : signed(width-1 downto 0);
  begin
    if temp'length = 0 then
       ret := (others => '0');
    elsif temp'length >= width then
       ret := temp(width-1 downto 0);
    else
       ret := resize(temp,width);
    end if;
    return ret;
  end pkg_resize;
end pkg_scala2hdl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_scala2hdl.all;
use work.all;
use work.pkg_enum.all;


entity MyTopLevel is
  port(
    io_axi_aw_valid : in std_logic;
    io_axi_aw_ready : out std_logic;
    io_axi_aw_payload_prot : in std_logic_vector(2 downto 0);
    io_axi_w_valid : in std_logic;
    io_axi_w_ready : out std_logic;
    io_axi_w_payload_data : in std_logic_vector(31 downto 0);
    io_axi_w_payload_strb : in std_logic_vector(3 downto 0);
    io_axi_b_valid : out std_logic;
    io_axi_b_ready : in std_logic;
    io_axi_b_payload_resp : out std_logic_vector(1 downto 0);
    io_axi_ar_valid : in std_logic;
    io_axi_ar_ready : out std_logic;
    io_axi_ar_payload_prot : in std_logic_vector(2 downto 0);
    io_axi_r_valid : out std_logic;
    io_axi_r_ready : in std_logic;
    io_axi_r_payload_data : out std_logic_vector(31 downto 0);
    io_axi_r_payload_resp : out std_logic_vector(1 downto 0);
    io_enable : out std_logic;
    io_axi_aw_payload_addr : in std_logic_vector(2 downto 0);
    io_axi_ar_payload_addr : in std_logic_vector(2 downto 0);
    clk : in std_logic;
    reset : in std_logic
  );
end MyTopLevel;

architecture arch of MyTopLevel is
  signal io_axi_ar_ready_read_buffer : std_logic;
  signal io_axi_aw_ready_read_buffer : std_logic;
  signal io_axi_w_ready_read_buffer : std_logic;

  signal zz_io_axi_aw_rData_addr : unsigned(2 downto 0);
  signal zz_io_axi_ar_rData_addr : unsigned(2 downto 0);
  signal busif_wstrb : std_logic_vector(3 downto 0);
  signal busif_wmask : std_logic_vector(31 downto 0);
  signal busif_wmaskn : std_logic_vector(31 downto 0);
  signal busif_readError : std_logic;
  signal busif_readData : std_logic_vector(31 downto 0);
  signal busif_axiAr_valid : std_logic;
  signal busif_axiAr_ready : std_logic;
  signal busif_axiAr_payload_addr : unsigned(2 downto 0);
  signal busif_axiAr_payload_prot : std_logic_vector(2 downto 0);
  signal io_axi_ar_rValid : std_logic;
  signal io_axi_ar_rData_addr : unsigned(2 downto 0);
  signal io_axi_ar_rData_prot : std_logic_vector(2 downto 0);
  signal when_Stream_l369 : std_logic;
  signal busif_axiR_valid : std_logic;
  signal busif_axiR_ready : std_logic;
  signal busif_axiR_payload_data : std_logic_vector(31 downto 0);
  signal busif_axiR_payload_resp : std_logic_vector(1 downto 0);
  signal busif_axiRValid : std_logic;
  signal busif_axiAw_valid : std_logic;
  signal busif_axiAw_ready : std_logic;
  signal busif_axiAw_payload_addr : unsigned(2 downto 0);
  signal busif_axiAw_payload_prot : std_logic_vector(2 downto 0);
  signal io_axi_aw_rValid : std_logic;
  signal io_axi_aw_rData_addr : unsigned(2 downto 0);
  signal io_axi_aw_rData_prot : std_logic_vector(2 downto 0);
  signal when_Stream_l369_1 : std_logic;
  signal busif_axiW_valid : std_logic;
  signal busif_axiW_ready : std_logic;
  signal busif_axiW_payload_data : std_logic_vector(31 downto 0);
  signal busif_axiW_payload_strb : std_logic_vector(3 downto 0);
  signal io_axi_w_rValid : std_logic;
  signal io_axi_w_rData_data : std_logic_vector(31 downto 0);
  signal io_axi_w_rData_strb : std_logic_vector(3 downto 0);
  signal when_Stream_l369_2 : std_logic;
  signal busif_axiB_valid : std_logic;
  signal busif_axiB_ready : std_logic;
  signal busif_axiB_payload_resp : std_logic_vector(1 downto 0);
  signal busif_axiBValid : std_logic;
  signal busif_askWrite : std_logic;
  signal busif_askRead : std_logic;
  signal busif_doWrite : std_logic;
  signal busif_doRead : std_logic;
  signal read_hit_0x0000 : std_logic;
  signal write_hit_0x0000 : std_logic;
  signal rev_num : std_logic_vector(3 downto 0);
  signal part_num : std_logic_vector(27 downto 0);
  signal read_hit_0x0004 : std_logic;
  signal write_hit_0x0004 : std_logic;
  signal enable : std_logic;
  signal when_RegInst_l644 : std_logic;
  signal switch_BusIfBase_l353 : unsigned(2 downto 0);
begin
  io_axi_ar_ready <= io_axi_ar_ready_read_buffer;
  io_axi_aw_ready <= io_axi_aw_ready_read_buffer;
  io_axi_w_ready <= io_axi_w_ready_read_buffer;
  process(busif_axiAr_ready,when_Stream_l369)
  begin
    io_axi_ar_ready_read_buffer <= busif_axiAr_ready;
    if when_Stream_l369 = '1' then
      io_axi_ar_ready_read_buffer <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l369 <= (not busif_axiAr_valid);
  busif_axiAr_valid <= io_axi_ar_rValid;
  busif_axiAr_payload_addr <= io_axi_ar_rData_addr;
  busif_axiAr_payload_prot <= io_axi_ar_rData_prot;
  process(busif_axiAw_ready,when_Stream_l369_1)
  begin
    io_axi_aw_ready_read_buffer <= busif_axiAw_ready;
    if when_Stream_l369_1 = '1' then
      io_axi_aw_ready_read_buffer <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l369_1 <= (not busif_axiAw_valid);
  busif_axiAw_valid <= io_axi_aw_rValid;
  busif_axiAw_payload_addr <= io_axi_aw_rData_addr;
  busif_axiAw_payload_prot <= io_axi_aw_rData_prot;
  process(busif_axiW_ready,when_Stream_l369_2)
  begin
    io_axi_w_ready_read_buffer <= busif_axiW_ready;
    if when_Stream_l369_2 = '1' then
      io_axi_w_ready_read_buffer <= pkg_toStdLogic(true);
    end if;
  end process;

  when_Stream_l369_2 <= (not busif_axiW_valid);
  busif_axiW_valid <= io_axi_w_rValid;
  busif_axiW_payload_data <= io_axi_w_rData_data;
  busif_axiW_payload_strb <= io_axi_w_rData_strb;
  busif_wstrb <= pkg_mux(busif_axiAr_valid,pkg_stdLogicVector("1111"),busif_axiW_payload_strb);
  process(busif_wstrb)
  begin
    busif_wmask(7 downto 0) <= pkg_mux(pkg_extract(busif_wstrb,0),pkg_stdLogicVector("11111111"),pkg_stdLogicVector("00000000"));
    busif_wmask(15 downto 8) <= pkg_mux(pkg_extract(busif_wstrb,1),pkg_stdLogicVector("11111111"),pkg_stdLogicVector("00000000"));
    busif_wmask(23 downto 16) <= pkg_mux(pkg_extract(busif_wstrb,2),pkg_stdLogicVector("11111111"),pkg_stdLogicVector("00000000"));
    busif_wmask(31 downto 24) <= pkg_mux(pkg_extract(busif_wstrb,3),pkg_stdLogicVector("11111111"),pkg_stdLogicVector("00000000"));
  end process;

  process(busif_wstrb)
  begin
    busif_wmaskn(7 downto 0) <= pkg_mux(pkg_extract(busif_wstrb,0),pkg_stdLogicVector("00000000"),pkg_stdLogicVector("11111111"));
    busif_wmaskn(15 downto 8) <= pkg_mux(pkg_extract(busif_wstrb,1),pkg_stdLogicVector("00000000"),pkg_stdLogicVector("11111111"));
    busif_wmaskn(23 downto 16) <= pkg_mux(pkg_extract(busif_wstrb,2),pkg_stdLogicVector("00000000"),pkg_stdLogicVector("11111111"));
    busif_wmaskn(31 downto 24) <= pkg_mux(pkg_extract(busif_wstrb,3),pkg_stdLogicVector("00000000"),pkg_stdLogicVector("11111111"));
  end process;

  process(busif_readError)
  begin
    if busif_readError = '1' then
      busif_axiR_payload_resp <= pkg_stdLogicVector("10");
    else
      busif_axiR_payload_resp <= pkg_stdLogicVector("00");
    end if;
  end process;

  busif_axiR_valid <= busif_axiRValid;
  busif_axiR_payload_data <= busif_readData;
  busif_axiB_payload_resp <= pkg_stdLogicVector("00");
  busif_axiB_valid <= busif_axiBValid;
  io_axi_r_valid <= busif_axiR_valid;
  busif_axiR_ready <= io_axi_r_ready;
  io_axi_r_payload_data <= busif_axiR_payload_data;
  io_axi_r_payload_resp <= busif_axiR_payload_resp;
  io_axi_b_valid <= busif_axiB_valid;
  busif_axiB_ready <= io_axi_b_ready;
  io_axi_b_payload_resp <= busif_axiB_payload_resp;
  busif_askWrite <= (busif_axiAw_valid and busif_axiW_valid);
  busif_askRead <= (busif_axiAr_valid or (busif_axiR_valid and (not busif_axiR_ready)));
  busif_doWrite <= (busif_askWrite and ((not busif_axiB_valid) or busif_axiB_ready));
  busif_doRead <= (busif_axiAr_valid and ((not busif_axiR_valid) or busif_axiR_ready));
  busif_axiAr_ready <= busif_doRead;
  busif_axiAw_ready <= busif_doWrite;
  busif_axiW_ready <= busif_doWrite;
  read_hit_0x0000 <= (pkg_toStdLogic(unsigned(pkg_cat(std_logic_vector(pkg_extract(busif_axiAr_payload_addr,2,2)),pkg_stdLogicVector("00"))) = pkg_unsigned("000")) and busif_doRead);
  write_hit_0x0000 <= (pkg_toStdLogic(busif_axiAw_payload_addr = pkg_unsigned("000")) and busif_doWrite);
  rev_num <= pkg_stdLogicVector("0001");
  part_num <= pkg_stdLogicVector("0001001000110100010101100111");
  read_hit_0x0004 <= (pkg_toStdLogic(unsigned(pkg_cat(std_logic_vector(pkg_extract(busif_axiAr_payload_addr,2,2)),pkg_stdLogicVector("00"))) = pkg_unsigned("100")) and busif_doRead);
  write_hit_0x0004 <= (pkg_toStdLogic(busif_axiAw_payload_addr = pkg_unsigned("100")) and busif_doWrite);
  when_RegInst_l644 <= (pkg_extract(busif_axiW_payload_data,0) and pkg_extract(busif_wmask,0));
  io_enable <= enable;
  switch_BusIfBase_l353 <= unsigned(pkg_cat(std_logic_vector(pkg_extract(busif_axiAr_payload_addr,2,2)),pkg_stdLogicVector("00")));
  zz_io_axi_aw_rData_addr <= unsigned(io_axi_aw_payload_addr);
  zz_io_axi_ar_rData_addr <= unsigned(io_axi_ar_payload_addr);
  process(clk, reset)
  begin
    if reset = '1' then
      busif_readError <= pkg_toStdLogic(false);
      busif_readData <= pkg_stdLogicVector("00000000000000000000000000000000");
      io_axi_ar_rValid <= pkg_toStdLogic(false);
      busif_axiRValid <= pkg_toStdLogic(false);
      io_axi_aw_rValid <= pkg_toStdLogic(false);
      io_axi_w_rValid <= pkg_toStdLogic(false);
      busif_axiBValid <= pkg_toStdLogic(false);
      enable <= pkg_toStdLogic(false);
    elsif rising_edge(clk) then
      if io_axi_ar_ready_read_buffer = '1' then
        io_axi_ar_rValid <= io_axi_ar_valid;
      end if;
      if io_axi_aw_ready_read_buffer = '1' then
        io_axi_aw_rValid <= io_axi_aw_valid;
      end if;
      if io_axi_w_ready_read_buffer = '1' then
        io_axi_w_rValid <= io_axi_w_valid;
      end if;
      if busif_axiR_ready = '1' then
        busif_axiRValid <= pkg_toStdLogic(false);
      end if;
      if busif_doRead = '1' then
        busif_axiRValid <= pkg_toStdLogic(true);
      end if;
      if busif_axiB_ready = '1' then
        busif_axiBValid <= pkg_toStdLogic(false);
      end if;
      if busif_doWrite = '1' then
        busif_axiBValid <= pkg_toStdLogic(true);
      end if;
      if write_hit_0x0004 = '1' then
        if when_RegInst_l644 = '1' then
          enable <= ((enable and pkg_extract(busif_wmaskn,0)) or ((not enable) and pkg_extract(busif_wmask,0)));
        end if;
      end if;
      if busif_askRead = '1' then
        case switch_BusIfBase_l353 is
          when "000" =>
            busif_readData <= pkg_cat(part_num,rev_num);
            busif_readError <= pkg_toStdLogic(false);
          when "100" =>
            busif_readData <= pkg_cat(pkg_stdLogicVector("0000000000000000000000000000000"),pkg_toStdLogicVector(enable));
            busif_readError <= pkg_toStdLogic(false);
          when others =>
            busif_readData <= pkg_stdLogicVector("00000000000000000000000000000000");
            busif_readError <= pkg_toStdLogic(false);
        end case;
      else
        busif_readData <= pkg_stdLogicVector("00000000000000000000000000000000");
        busif_readError <= pkg_toStdLogic(false);
      end if;
    end if;
  end process;

  process(clk)
  begin
    if rising_edge(clk) then
      if io_axi_ar_ready_read_buffer = '1' then
        io_axi_ar_rData_addr <= zz_io_axi_ar_rData_addr;
        io_axi_ar_rData_prot <= io_axi_ar_payload_prot;
      end if;
      if io_axi_aw_ready_read_buffer = '1' then
        io_axi_aw_rData_addr <= zz_io_axi_aw_rData_addr;
        io_axi_aw_rData_prot <= io_axi_aw_payload_prot;
      end if;
      if io_axi_w_ready_read_buffer = '1' then
        io_axi_w_rData_data <= io_axi_w_payload_data;
        io_axi_w_rData_strb <= io_axi_w_payload_strb;
      end if;
    end if;
  end process;

end arch;

