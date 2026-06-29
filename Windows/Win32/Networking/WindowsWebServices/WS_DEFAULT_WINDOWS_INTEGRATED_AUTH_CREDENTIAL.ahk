#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE }

/**
 * Type for supplying a Windows Integrated Authentication credential based on the current Windows identity.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_default_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL {
    #StructPack 4

    /**
     * The base type from which this type and all other Windows Integrated Authentication credential types derive.
     *                 See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_windows_integrated_auth_credential">WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a>.
     */
    credential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL

}
