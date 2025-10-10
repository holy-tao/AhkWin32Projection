#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Font class encapsulates the characteristics, such as family, height, size, and style (or combination of styles), of a specific font. A Font object is used when drawing strings.
 * @remarks
 * 
  * When using GDI+ API, you must never allow your application to download arbitrary fonts from untrusted sources. 
  * The operating system requires elevated privileges to assure that all installed fonts are trusted.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusheaders/nl-gdiplusheaders-font
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Font extends Win32Struct
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
