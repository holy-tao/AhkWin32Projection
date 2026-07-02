#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_INCOMING_ASSOC_DECISION {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    PeerMacAddr : Int8[6]

    bAccept : BOOLEAN

    usReasonCode : UInt16

    uAssocResponseIEsOffset : UInt32

    uAssocResponseIEsLength : UInt32

}
