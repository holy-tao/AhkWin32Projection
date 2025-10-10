#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A CachedBitmap object stores a bitmap in a format that is optimized for display on a particular device. To display a cached bitmap, call the Graphics::DrawCachedBitmap method.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-cachedbitmap
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class CachedBitmap extends Win32Struct
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
