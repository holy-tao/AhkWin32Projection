#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_USERNAME_CREDENTIAL.ahk
#Include .\WS_STRING.ahk

/**
 * The type for supplying a username/password pair as strings.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_string_username_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_STRING_USERNAME_CREDENTIAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type from which this type and all other username credential types derive.
     * @type {WS_USERNAME_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_USERNAME_CREDENTIAL(0, this)
            return this.__credential
        }
    }

    /**
     * The username.
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
     * The password.
     * @type {WS_STRING}
     */
    password{
        get {
            if(!this.HasProp("__password"))
                this.__password := WS_STRING(24, this)
            return this.__password
        }
    }
}
