#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_CREDENTIAL0.ahk" { IKEEXT_CREDENTIAL0 }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION0.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION0 }
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_CERTIFICATE_CREDENTIAL0.ahk" { IKEEXT_CERTIFICATE_CREDENTIAL0 }
#Import ".\IKEEXT_NAME_CREDENTIAL0.ahk" { IKEEXT_NAME_CREDENTIAL0 }

/**
 * Is used to store credential information used for the authentication. (IKEEXT_CREDENTIAL_PAIR0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credential_pair0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CREDENTIAL_PAIR0 {
    #StructPack 8

    /**
     * Local credentials used for authentication.
     * 
     * See [IKEEXT_CREDENTIAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential0) for more information.
     */
    localCredentials : IKEEXT_CREDENTIAL0

    /**
     * Peer credentials used for authentication.
     * 
     * See [IKEEXT_CREDENTIAL0](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential0) for more information.
     */
    peerCredentials : IKEEXT_CREDENTIAL0

}
