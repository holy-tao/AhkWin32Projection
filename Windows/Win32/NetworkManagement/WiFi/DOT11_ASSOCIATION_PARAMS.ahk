#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ASSOCIATION_PARAMS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    BSSID : Int8[6]

    uAssocRequestIEsOffset : UInt32

    uAssocRequestIEsLength : UInt32

}
