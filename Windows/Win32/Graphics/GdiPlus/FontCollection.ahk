#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FontCollection class is an abstract base class. It contains methods for enumerating the font families in a collection of fonts. Objects built from this class include the InstalledFontCollection and PrivateFontCollection classes.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-fontcollection
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class FontCollection extends Win32Struct
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
