#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_UDPROW2.ahk" { MIB_UDPROW2 }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_UDPTABLE2 {
    #StructPack 8

    dwNumEntries : UInt32

    table : MIB_UDPROW2[1]

}
