#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct SOCKADDR_HV {
    #StructPack 4

    Family : ADDRESS_FAMILY

    Reserved : UInt16

    VmId : Guid

    ServiceId : Guid

}
