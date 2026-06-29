#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct HVSOCKET_ADDRESS_INFO {
    #StructPack 4

    SystemId : Guid

    VirtualMachineId : Guid

    SiloId : Guid

    Flags : UInt32

}
