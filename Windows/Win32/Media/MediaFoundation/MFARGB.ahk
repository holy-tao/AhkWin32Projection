#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes an ARGB color value.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfargb
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFARGB extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Blue value.
     * @type {Integer}
     */
    rgbBlue {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Green value.
     * @type {Integer}
     */
    rgbGreen {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Red value.
     * @type {Integer}
     */
    rgbRed {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Alpha value.
     * @type {Integer}
     */
    rgbAlpha {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
