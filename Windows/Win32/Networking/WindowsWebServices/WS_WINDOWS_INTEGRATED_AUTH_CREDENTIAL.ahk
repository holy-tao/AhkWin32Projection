#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE.ahk

/**
 * The abstract base type for all credential types used with Windows Integrated Authentication.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL extends Win32Struct {
    static sizeof => 4

    static packingSize => 4

    /**
     * The selector for the type of the Windows credential.
     * @type {WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL_TYPE}
     */
    credentialType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
