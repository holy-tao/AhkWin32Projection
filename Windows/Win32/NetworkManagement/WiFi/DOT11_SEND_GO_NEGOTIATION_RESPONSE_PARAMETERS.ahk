#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_WFD_GO_INTENT.ahk" { DOT11_WFD_GO_INTENT }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_WFD_GROUP_ID.ahk" { DOT11_WFD_GROUP_ID }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import ".\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk" { DOT11_WFD_CONFIGURATION_TIMEOUT }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SEND_GO_NEGOTIATION_RESPONSE_PARAMETERS {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    PeerDeviceAddress : Int8[6]

    DialogToken : Int8

    RequestContext : IntPtr

    uSendTimeout : UInt32

    Status : Int8

    GroupOwnerIntent : DOT11_WFD_GO_INTENT

    MinimumConfigTimeout : DOT11_WFD_CONFIGURATION_TIMEOUT

    IntendedInterfaceAddress : Int8[6]

    GroupCapability : Int8

    GroupID : DOT11_WFD_GROUP_ID

    bUseGroupID : BOOLEAN

    uIEsOffset : UInt32

    uIEsLength : UInt32

}
