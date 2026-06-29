#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE.ahk" { WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE }

/**
 * Type for supplying a Windows credential as username, password, domain strings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL {
    #StructPack 8

    /**
     * The base type from which this type and all other Windows Integrated
     * Authentication credential types derive.
     */
    credential : WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL

    /**
     * The username as a string.  This must be a valid user. To specify default credentials, use the WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL instead.
     */
    username : WS_STRING

    /**
     * The password for the username as a string.
     *                 To specify a blank password, the length field of the string must be set to 0.
     */
    password : WS_STRING

    /**
     * The domain name or the workgroup name as a string.
     */
    domain : WS_STRING

}
