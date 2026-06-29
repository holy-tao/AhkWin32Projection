#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE.ahk" { IKEEXT_AUTHENTICATION_IMPERSONATION_TYPE }
#Import ".\IKEEXT_PRESHARED_KEY_AUTHENTICATION1.ahk" { IKEEXT_PRESHARED_KEY_AUTHENTICATION1 }
#Import ".\IKEEXT_NAME_CREDENTIAL0.ahk" { IKEEXT_NAME_CREDENTIAL0 }
#Import ".\IKEEXT_CERTIFICATE_CREDENTIAL1.ahk" { IKEEXT_CERTIFICATE_CREDENTIAL1 }
#Import ".\IKEEXT_AUTHENTICATION_METHOD_TYPE.ahk" { IKEEXT_AUTHENTICATION_METHOD_TYPE }
#Import ".\IKEEXT_CREDENTIAL2.ahk" { IKEEXT_CREDENTIAL2 }

/**
 * Is used to store credential information used for the authentication. (IKEEXT_CREDENTIAL_PAIR2)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_credential_pair2
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CREDENTIAL_PAIR2 {
    #StructPack 8

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Local credentials used for authentication.
     */
    localCredentials : IKEEXT_CREDENTIAL2

    /**
     * Type: [IKEEXT_CREDENTIAL2](/windows/desktop/api/iketypes/ns-iketypes-ikeext_credential2)</b>
     * 
     * Peer credentials used for authentication.
     */
    peerCredentials : IKEEXT_CREDENTIAL2

}
