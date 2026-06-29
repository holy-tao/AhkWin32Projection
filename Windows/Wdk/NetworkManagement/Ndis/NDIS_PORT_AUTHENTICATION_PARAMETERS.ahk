#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_PORT_CONTROL_STATE.ahk" { NDIS_PORT_CONTROL_STATE }
#Import ".\NDIS_PORT_AUTHORIZATION_STATE.ahk" { NDIS_PORT_AUTHORIZATION_STATE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_PORT_AUTHENTICATION_PARAMETERS {
    #StructPack 8

    Header : IntPtr

    SendControlState : NDIS_PORT_CONTROL_STATE

    RcvControlState : NDIS_PORT_CONTROL_STATE

    SendAuthorizationState : NDIS_PORT_AUTHORIZATION_STATE

    RcvAuthorizationState : NDIS_PORT_AUTHORIZATION_STATE

}
