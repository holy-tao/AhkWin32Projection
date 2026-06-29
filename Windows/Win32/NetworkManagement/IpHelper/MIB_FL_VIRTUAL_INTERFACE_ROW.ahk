#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\NET_FL_VIRTUAL_INTERFACE_ORIGIN.ahk" { NET_FL_VIRTUAL_INTERFACE_ORIGIN }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\NET_FL_ISOLATION_MODE.ahk" { NET_FL_ISOLATION_MODE }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_FL_VIRTUAL_INTERFACE_ROW {
    #StructPack 8

    Family : ADDRESS_FAMILY

    IfLuid : NET_LUID_LH

    VirtualIfId : UInt32

    CompartmentGuid : Guid

    IsolationMode : NET_FL_ISOLATION_MODE

    Origin : NET_FL_VIRTUAL_INTERFACE_ORIGIN

    VirtualIfLuid : NET_LUID_LH

    VirtualIfIndex : UInt32

    AllowLocalNd : BOOLEAN

    AttachedFlsnpiClients : UInt32

    FlsnpiClientConfigErrors : UInt32

    FlsnpiClientInjectErrors : Int64

    FlsnpiClientCloneErrors : Int64

    InFlsnpiIndicatedPackets : Int64

    InFlsnpiClientReturnedPackets : Int64

    InFlsnpiClientSilentlyDroppedPackets : Int64

    InFlsnpiClientDroppedPackets : Int64

    InFlsnpiClientInjectedPackets : Int64

    InFlsnpiClientClonedPackets : Int64

    OutFlsnpiIndicatedPackets : Int64

    OutFlsnpiClientReturnedPackets : Int64

    OutFlsnpiClientDroppedPackets : Int64

    OutFlsnpiClientSilentlyDroppedPackets : Int64

    OutFlsnpiClientInjectedPackets : Int64

    OutFlsnpiClientClonedPackets : Int64

    OutFlsnpiClientClonedPacketsForNbSplit : Int64

}
