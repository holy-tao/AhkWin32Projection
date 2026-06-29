#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_WFD_CHANNEL.ahk" { DOT11_WFD_CHANNEL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_WFD_GROUP_ID.ahk" { DOT11_WFD_GROUP_ID }
#Import ".\DOT11_WFD_INVITATION_FLAGS.ahk" { DOT11_WFD_INVITATION_FLAGS }
#Import ".\DOT11_SSID.ahk" { DOT11_SSID }
#Import ".\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk" { DOT11_WFD_CONFIGURATION_TIMEOUT }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SEND_INVITATION_REQUEST_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    DialogToken : Int8

    PeerDeviceAddress : Int8[6]

    uSendTimeout : UInt32

    MinimumConfigTimeout : DOT11_WFD_CONFIGURATION_TIMEOUT

    InvitationFlags : DOT11_WFD_INVITATION_FLAGS

    GroupBSSID : Int8[6]

    bUseGroupBSSID : BOOLEAN

    OperatingChannel : DOT11_WFD_CHANNEL

    bUseSpecifiedOperatingChannel : BOOLEAN

    GroupID : DOT11_WFD_GROUP_ID

    bLocalGO : BOOLEAN

    uIEsOffset : UInt32

    uIEsLength : UInt32

}
