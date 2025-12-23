#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RGBQUAD structure describes a color consisting of relative intensities of red, green, and blue.
 * @remarks
 * The <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure consists of an array of <b>RGBQUAD</b> structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rgbquad
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class RGBQUAD extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * The intensity of blue in the color.
     * @type {Integer}
     */
    rgbBlue {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The intensity of green in the color.
     * @type {Integer}
     */
    rgbGreen {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The intensity of red in the color.
     * @type {Integer}
     */
    rgbRed {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * This member is reserved and must be zero.
     * @type {Integer}
     */
    rgbReserved {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
