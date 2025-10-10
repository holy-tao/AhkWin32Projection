#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the color and usage of an entry in a logical palette.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-paletteentry
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class PALETTEENTRY extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The red intensity value for the palette entry.
     * @type {Integer}
     */
    peRed {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The green intensity value for the palette entry.
     * @type {Integer}
     */
    peGreen {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The blue intensity value for the palette entry.
     * @type {Integer}
     */
    peBlue {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BYTE</a></b>
     * 
     * The alpha intensity value for the palette entry. Note that as of DirectX 8, this member is treated differently than documented for Windows.
     * @type {Integer}
     */
    peFlags {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
