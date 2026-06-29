#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_RECEIVED_INVITATION_RESPONSE_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    TransmitterDeviceAddress : Int8[6]

    BSSID : Int8[6]

    DialogToken : Int8

    uIEsOffset : UInt32

    uIEsLength : UInt32

}
