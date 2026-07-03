#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_ROAMING_START_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    AdhocBSSID : Int8[6]

    AdhocSSID : DOT11_SSID

    uRoamingReason : UInt32

}
