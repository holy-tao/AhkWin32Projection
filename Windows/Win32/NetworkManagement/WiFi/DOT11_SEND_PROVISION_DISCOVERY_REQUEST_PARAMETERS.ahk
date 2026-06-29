#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_WFD_GROUP_ID.ahk" { DOT11_WFD_GROUP_ID }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SEND_PROVISION_DISCOVERY_REQUEST_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    DialogToken : Int8

    PeerDeviceAddress : Int8[6]

    uSendTimeout : UInt32

    GroupCapability : Int8

    GroupID : DOT11_WFD_GROUP_ID

    bUseGroupID : BOOLEAN

    uIEsOffset : UInt32

    uIEsLength : UInt32

}
