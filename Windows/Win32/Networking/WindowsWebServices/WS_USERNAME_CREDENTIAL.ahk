#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_USERNAME_CREDENTIAL_TYPE.ahk" { WS_USERNAME_CREDENTIAL_TYPE }

/**
 * The abstract base type for all username/password credentials.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_USERNAME_CREDENTIAL {
    #StructPack 4

    /**
     * The selector for the type of the username credential.
     */
    credentialType : WS_USERNAME_CREDENTIAL_TYPE

}
