#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_VWIFI_COMBINATION.ahk" { DOT11_VWIFI_COMBINATION }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_VWIFI_ATTRIBUTES {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uTotalNumOfEntries : UInt32

    Combinations : DOT11_VWIFI_COMBINATION[1]

}
