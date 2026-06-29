#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_INCOMING_ASSOC_REQUEST_RECEIVED_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    PeerMacAddr : Int8[6]

    bReAssocReq : BOOLEAN

    uAssocReqOffset : UInt32

    uAssocReqSize : UInt32

}
