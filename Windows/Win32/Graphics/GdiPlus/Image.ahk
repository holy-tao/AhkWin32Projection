#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Image class provides methods for loading and saving raster images (bitmaps) and vector images (metafiles).
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-image
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Image extends Win32Struct
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
