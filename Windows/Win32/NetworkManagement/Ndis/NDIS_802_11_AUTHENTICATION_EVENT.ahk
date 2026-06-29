#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_AUTHENTICATION_REQUEST.ahk" { NDIS_802_11_AUTHENTICATION_REQUEST }
#Import ".\NDIS_802_11_STATUS_TYPE.ahk" { NDIS_802_11_STATUS_TYPE }
#Import ".\NDIS_802_11_STATUS_INDICATION.ahk" { NDIS_802_11_STATUS_INDICATION }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_AUTHENTICATION_EVENT {
    #StructPack 4

    Status : NDIS_802_11_STATUS_INDICATION

    Request : NDIS_802_11_AUTHENTICATION_REQUEST[1]

}
