#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_INCOMING_ASSOC_STARTED_PARAMETERS {
    #StructPack 2

    Header : NDIS_OBJECT_HEADER

    PeerMacAddr : Int8[6]

}
