#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_USERNAME_CREDENTIAL.ahk" { WS_USERNAME_CREDENTIAL }
#Import ".\WS_STRING.ahk" { WS_STRING }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WS_USERNAME_CREDENTIAL_TYPE.ahk" { WS_USERNAME_CREDENTIAL_TYPE }

/**
 * The type for supplying a username/password pair as strings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_string_username_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_STRING_USERNAME_CREDENTIAL {
    #StructPack 8

    /**
     * The base type from which this type and all other username credential types derive.
     */
    credential : WS_USERNAME_CREDENTIAL

    /**
     * The username.
     */
    username : WS_STRING

    /**
     * The password.
     */
    password : WS_STRING

}
