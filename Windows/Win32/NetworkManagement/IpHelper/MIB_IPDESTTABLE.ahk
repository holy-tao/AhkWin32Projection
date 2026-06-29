#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_IPFORWARD_TYPE.ahk" { MIB_IPFORWARD_TYPE }
#Import ".\MIB_IPDESTROW.ahk" { MIB_IPDESTROW }
#Import ".\MIB_IPFORWARDROW.ahk" { MIB_IPFORWARDROW }
#Import "..\..\Networking\WinSock\NL_ROUTE_PROTOCOL.ahk" { NL_ROUTE_PROTOCOL }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_IPDESTTABLE {
    #StructPack 4

    dwNumEntries : UInt32

    table : MIB_IPDESTROW[1]

}
