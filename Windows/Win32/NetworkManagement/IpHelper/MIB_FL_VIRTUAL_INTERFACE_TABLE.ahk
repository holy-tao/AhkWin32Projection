#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\MIB_FL_VIRTUAL_INTERFACE_ROW.ahk" { MIB_FL_VIRTUAL_INTERFACE_ROW }
#Import ".\NET_FL_ISOLATION_MODE.ahk" { NET_FL_ISOLATION_MODE }
#Import ".\NET_FL_VIRTUAL_INTERFACE_ORIGIN.ahk" { NET_FL_VIRTUAL_INTERFACE_ORIGIN }
#Import "..\Ndis\NET_LUID_LH.ahk" { NET_LUID_LH }
#Import "..\..\Networking\WinSock\ADDRESS_FAMILY.ahk" { ADDRESS_FAMILY }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_FL_VIRTUAL_INTERFACE_TABLE {
    #StructPack 8

    NumEntries : UInt32

    Table : MIB_FL_VIRTUAL_INTERFACE_ROW[1]

}
