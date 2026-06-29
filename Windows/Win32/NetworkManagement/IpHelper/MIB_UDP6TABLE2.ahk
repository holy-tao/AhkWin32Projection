#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIB_UDP6ROW2.ahk" { MIB_UDP6ROW2 }

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct MIB_UDP6TABLE2 {
    #StructPack 8

    dwNumEntries : UInt32

    table : MIB_UDP6ROW2[1]

}
