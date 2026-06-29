#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_AVAILABILITY_SET_CONFIG {
    #StructPack 4

    dwVersion : UInt32

    dwUpdateDomains : UInt32

    dwFaultDomains : UInt32

    bReserveSpareNode : BOOL

}
