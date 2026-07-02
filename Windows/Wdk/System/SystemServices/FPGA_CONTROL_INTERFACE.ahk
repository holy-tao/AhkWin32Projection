#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PFPGA_CONTROL_ERROR_REPORTING.ahk" { PFPGA_CONTROL_ERROR_REPORTING }
#Import ".\PFPGA_CONTROL_LINK.ahk" { PFPGA_CONTROL_LINK }
#Import ".\PFPGA_BUS_SCAN.ahk" { PFPGA_BUS_SCAN }
#Import ".\PINTERFACE_DEREFERENCE.ahk" { PINTERFACE_DEREFERENCE }
#Import ".\PINTERFACE_REFERENCE.ahk" { PINTERFACE_REFERENCE }
#Import ".\PFPGA_CONTROL_CONFIG_SPACE.ahk" { PFPGA_CONTROL_CONFIG_SPACE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FPGA_CONTROL_INTERFACE {
    #StructPack 8

    Size : UInt16

    Version : UInt16

    Context : IntPtr

    InterfaceReference : PINTERFACE_REFERENCE

    InterfaceDereference : PINTERFACE_DEREFERENCE

    BusScan : PFPGA_BUS_SCAN

    ControlLink : PFPGA_CONTROL_LINK

    ControlConfigSpace : PFPGA_CONTROL_CONFIG_SPACE

    ControlErrorReporting : PFPGA_CONTROL_ERROR_REPORTING

}
