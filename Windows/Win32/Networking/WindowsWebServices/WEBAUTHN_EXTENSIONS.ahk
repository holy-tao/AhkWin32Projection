#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of extensions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/webauthn/ns-webauthn-webauthn_extensions
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WEBAUTHN_EXTENSIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The size of **pExtensions**.
     * @type {Integer}
     */
    cExtensions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The list of extensions.
     * @type {Pointer<WEBAUTHN_EXTENSION>}
     */
    pExtensions {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
