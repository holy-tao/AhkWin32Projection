#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk
#Include .\WS_STRING.ahk

/**
 * Type for supplying a Windows credential as username, password, domain strings.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_string_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_STRING_WINDOWS_INTEGRATED_AUTH_CREDENTIAL extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The base type from which this type and all other Windows Integrated
     * Authentication credential types derive.
     * @type {WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL(0, this)
            return this.__credential
        }
    }

    /**
     * The username as a string.  This must be a valid user. To specify default credentials, use the WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL instead.
     * @type {WS_STRING}
     */
    username{
        get {
            if(!this.HasProp("__username"))
                this.__username := WS_STRING(8, this)
            return this.__username
        }
    }

    /**
     * The password for the username as a string.
     *                 To specify a blank password, the length field of the string must be set to 0.
     * @type {WS_STRING}
     */
    password{
        get {
            if(!this.HasProp("__password"))
                this.__password := WS_STRING(24, this)
            return this.__password
        }
    }

    /**
     * The domain name or the workgroup name as a string.
     * @type {WS_STRING}
     */
    domain{
        get {
            if(!this.HasProp("__domain"))
                this.__domain := WS_STRING(40, this)
            return this.__domain
        }
    }
}
