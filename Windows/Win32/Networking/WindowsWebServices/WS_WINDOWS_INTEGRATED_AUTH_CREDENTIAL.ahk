#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE }

/**
 * The abstract base type for all credential types used with Windows Integrated Authentication.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL {
    #StructPack 4

    /**
     * The selector for the type of the Windows credential.
     */
    credentialType : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE

}
