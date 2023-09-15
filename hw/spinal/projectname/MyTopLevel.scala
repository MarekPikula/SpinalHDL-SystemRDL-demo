package projectname

import spinal.core._
import spinal.lib._
import spinal.lib.bus.regif._
import spinal.lib.bus.regif.AccessType._
import spinal.lib.bus.amba4.axilite._

// Hardware definition
case class MyTopLevel() extends Component {
  val io = new Bundle {
    val axi = slave(AxiLite4(AxiLite4Config(3, 32)))
    val enable = out Bool ()
  }

  val busif = AxiLite4BusInterface(io.axi, (0, 4 Bytes))

  val chip_id_reg = busif.newReg("This register contains the part # and revision # for XYZ ASIC")
  val rev_num = chip_id_reg.field(Bits(4 bits), RO, 1, "This field represents the chip's revision number") := 1
  val part_num =
    chip_id_reg.field(Bits(28 bits), RO, 0x1234567, "This field represents the chip's part number") := 0x1234567

  val enable = busif.newReg("Toggle the peripheral enable on write").field(Bool(), W1T, "Enable toggle")
  io.enable <> enable

  busif.accept(HtmlGenerator("example", "RDL Example Registers"))
  busif.accept(
    SystemRdlGenerator(
      "example",
      "some_register_map",
      Some("RDL Example Registers"),
      Some("This address map contains some example registers to show how RDL can be utilized in various situations")
    )
  )
}

object MyTopLevelVerilog extends App {
  Config.spinal.generateVerilog(MyTopLevel())
}

object MyTopLevelVhdl extends App {
  Config.spinal.generateVhdl(MyTopLevel())
}
