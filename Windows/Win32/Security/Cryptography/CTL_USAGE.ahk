#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an array of object identifiers (OIDs) for Certificate Trust List (CTL) extensions.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_usage
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_USAGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Number of elements in the <b>rgpszUsageIdentifier</b> member array.
     * @type {Integer}
     */
    cUsageIdentifier {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Array of object identifiers (OIDs) of CTL extensions.
     * @type {Pointer<Byte>}
     */
    rgpszUsageIdentifier {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
