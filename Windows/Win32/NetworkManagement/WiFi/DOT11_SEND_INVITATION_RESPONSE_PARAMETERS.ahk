#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\DOT11_WFD_CHANNEL.ahk" { DOT11_WFD_CHANNEL }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\DOT11_WFD_CONFIGURATION_TIMEOUT.ahk" { DOT11_WFD_CONFIGURATION_TIMEOUT }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_SEND_INVITATION_RESPONSE_PARAMETERS {
    #StructPack 8

    Header : NDIS_OBJECT_HEADER

    ReceiverDeviceAddress : Int8[6]

    DialogToken : Int8

    RequestContext : IntPtr

    uSendTimeout : UInt32

    Status : Int8

    MinimumConfigTimeout : DOT11_WFD_CONFIGURATION_TIMEOUT

    GroupBSSID : Int8[6]

    bUseGroupBSSID : BOOLEAN

    OperatingChannel : DOT11_WFD_CHANNEL

    bUseSpecifiedOperatingChannel : BOOLEAN

    uIEsOffset : UInt32

    uIEsLength : UInt32

}
