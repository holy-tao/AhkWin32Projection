#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_VWIFI_COMBINATION_V2 {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uNumInfrastructure : UInt32

    uNumAdhoc : UInt32

    uNumSoftAP : UInt32

    uNumVirtualStation : UInt32

}
