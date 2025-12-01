#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RGBTRIPLE structure describes a color consisting of relative intensities of red, green, and blue. The bmciColors member of the BITMAPCOREINFO structure consists of an array of RGBTRIPLE structures.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-rgbtriple
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class RGBTRIPLE extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * The intensity of blue in the color.
     * @type {Integer}
     */
    rgbtBlue {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The intensity of green in the color.
     * @type {Integer}
     */
    rgbtGreen {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The intensity of red in the color.
     * @type {Integer}
     */
    rgbtRed {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
