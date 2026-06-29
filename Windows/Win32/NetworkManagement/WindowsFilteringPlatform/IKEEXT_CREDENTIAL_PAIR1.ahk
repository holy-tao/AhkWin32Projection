#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION1 }
#Import ".\IKEEXT_CREDENTIAL1.ahk" { IKEEXT_CREDENTIAL1 }
#Import ".\IKEEXT_CERTIFICATE_CREDENTIAL1.ahk" { IKEEXT_CERTIFICATE_CREDENTIAL1 }
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_NAME_CREDENTIAL0.ahk" { IKEEXT_NAME_CREDENTIAL0 }

/**
 * Is used to store credential information used for the authentication. (IKEEXT_CREDENTIAL_PAIR1)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credential_pair1
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CREDENTIAL_PAIR1 {
    #StructPack 8

    /**
     * Local credentials used for authentication.
     * 
     * See [IKEEXT_CREDENTIAL1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential1) for more information.
     */
    localCredentials : IKEEXT_CREDENTIAL1

    /**
     * Peer credentials used for authentication.
     * 
     * See [IKEEXT_CREDENTIAL1](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential1) for more information.
     */
    peerCredentials : IKEEXT_CREDENTIAL1

}
