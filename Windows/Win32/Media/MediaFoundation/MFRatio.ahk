#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents a ratio.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfratio
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFRatio extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Numerator of the ratio.
     * @type {Integer}
     */
    Numerator {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Denominator of the ratio.
     * @type {Integer}
     */
    Denominator {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
