#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_PORT_CONTROL_STATE.ahk" { NDIS_PORT_CONTROL_STATE }
#Import "..\..\..\Win32\NetworkManagement\Ndis\NET_IF_MEDIA_CONNECT_STATE.ahk" { NET_IF_MEDIA_CONNECT_STATE }
#Import ".\NDIS_PORT_AUTHORIZATION_STATE.ahk" { NDIS_PORT_AUTHORIZATION_STATE }
#Import "..\..\..\Win32\NetworkManagement\Ndis\NET_IF_DIRECTION_TYPE.ahk" { NET_IF_DIRECTION_TYPE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PORT_STATE {
    #StructPack 8

    Header : IntPtr

    MediaConnectState : NET_IF_MEDIA_CONNECT_STATE

    XmitLinkSpeed : Int64

    RcvLinkSpeed : Int64

    Direction : NET_IF_DIRECTION_TYPE

    SendControlState : NDIS_PORT_CONTROL_STATE

    RcvControlState : NDIS_PORT_CONTROL_STATE

    SendAuthorizationState : NDIS_PORT_AUTHORIZATION_STATE

    RcvAuthorizationState : NDIS_PORT_AUTHORIZATION_STATE

    Flags : UInt32

}
