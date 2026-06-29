#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_802_11_AUTHENTICATION_ENCRYPTION.ahk" { NDIS_802_11_AUTHENTICATION_ENCRYPTION }
#Import ".\NDIS_802_11_WEP_STATUS.ahk" { NDIS_802_11_WEP_STATUS }
#Import ".\NDIS_802_11_AUTHENTICATION_MODE.ahk" { NDIS_802_11_AUTHENTICATION_MODE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_CAPABILITY {
    #StructPack 4

    Length : UInt32

    Version : UInt32

    NoOfPMKIDs : UInt32

    NoOfAuthEncryptPairsSupported : UInt32

    AuthenticationEncryptionSupported : NDIS_802_11_AUTHENTICATION_ENCRYPTION[1]

}
