#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_WEP_STATUS.ahk" { NDIS_802_11_WEP_STATUS }
#Import ".\NDIS_802_11_AUTHENTICATION_MODE.ahk" { NDIS_802_11_AUTHENTICATION_MODE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_AUTHENTICATION_ENCRYPTION {
    #StructPack 4

    AuthModeSupported : NDIS_802_11_AUTHENTICATION_MODE

    EncryptStatusSupported : NDIS_802_11_WEP_STATUS

}
