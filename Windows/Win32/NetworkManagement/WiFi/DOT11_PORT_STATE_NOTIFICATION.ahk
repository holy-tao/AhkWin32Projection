#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PORT_STATE_NOTIFICATION {
    #StructPack 2

    Header : NDIS_OBJECT_HEADER

    PeerMac : Int8[6]

    bOpen : BOOLEAN

}
