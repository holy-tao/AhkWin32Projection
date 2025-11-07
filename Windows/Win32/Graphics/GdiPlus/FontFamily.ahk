#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This FontFamily class encapsulates a set of fonts that make up a font family. A font family is a group of fonts that have the same typeface but different styles.
 * @remarks
 * 
 * Only regular, bold, italic, and bold italic are abstracted into the family, other styles, such as Narrow or Black, are considered separate font families. For example Times New Roman is a font family. The Times New Roman font family includes regular, bold, italic, and bold italic.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-fontfamily
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FontFamily extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
