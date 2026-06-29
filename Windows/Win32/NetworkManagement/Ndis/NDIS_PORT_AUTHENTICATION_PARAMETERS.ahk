#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }
#Import ".\NDIS_PORT_AUTHORIZATION_STATE.ahk" { NDIS_PORT_AUTHORIZATION_STATE }
#Import ".\NDIS_PORT_CONTROL_STATE.ahk" { NDIS_PORT_CONTROL_STATE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_PORT_AUTHENTICATION_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    SendControlState : NDIS_PORT_CONTROL_STATE

    RcvControlState : NDIS_PORT_CONTROL_STATE

    SendAuthorizationState : NDIS_PORT_AUTHORIZATION_STATE

    RcvAuthorizationState : NDIS_PORT_AUTHORIZATION_STATE

}
