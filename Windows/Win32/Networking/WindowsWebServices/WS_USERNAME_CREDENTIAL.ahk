#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_USERNAME_CREDENTIAL_TYPE.ahk

/**
 * The abstract base type for all username/password credentials.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_username_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_USERNAME_CREDENTIAL extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * The selector for the type of the username credential.
     * @type {WS_USERNAME_CREDENTIAL_TYPE}
     */
    credentialType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
