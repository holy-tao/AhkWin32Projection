#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an extension.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_extension
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_EXTENSION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The extension identifier.
     * @type {PWSTR}
     */
    pwszExtensionIdentifier {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size of **pvExtension**.
     * @type {Integer}
     */
    cbExtension {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The extension data.
     * @type {Pointer<Void>}
     */
    pvExtension {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
