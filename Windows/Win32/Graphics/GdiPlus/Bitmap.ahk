#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the Base64 encoded data for a bitmap contained in the Journal file as a background image.
 * @see https://learn.microsoft.com/windows/win32/tablet/bitmap-element
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Bitmap extends Win32Struct
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
