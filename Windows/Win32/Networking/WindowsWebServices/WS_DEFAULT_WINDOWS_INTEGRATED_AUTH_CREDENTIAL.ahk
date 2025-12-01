#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk

/**
 * Type for supplying a Windows Integrated Authentication credential based on the current Windows identity.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_default_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_DEFAULT_WINDOWS_INTEGRATED_AUTH_CREDENTIAL extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The base type from which this type and all other Windows Integrated Authentication credential types derive.
     *                 See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_windows_integrated_auth_credential">WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL</a>.
     * @type {WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL(0, this)
            return this.__credential
        }
    }
}
