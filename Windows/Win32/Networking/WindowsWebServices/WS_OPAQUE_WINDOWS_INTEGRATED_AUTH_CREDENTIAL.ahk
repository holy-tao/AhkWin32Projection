#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL.ahk

/**
 * Type for supplying a Windows Integrated Authentication credential as an opaque handle created by SspiPromptForCredentials and the related family of APIs. This feature is available only on Windows 7 and later.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_opaque_windows_integrated_auth_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_OPAQUE_WINDOWS_INTEGRATED_AUTH_CREDENTIAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The base type from which this type and all other Windows Integrated Authentication credential types derive.
     * @type {WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_WINDOWS_INTEGRATED_AUTH_CREDENTIAL(this.ptr + 0)
            return this.__credential
        }
    }

    /**
     * The opaque form of authentication identity. The supplied value must be of the type PSEC_WINNT_AUTH_IDENTITY_OPAQUE.
     * @type {Pointer<Void>}
     */
    opaqueAuthIdentity {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
