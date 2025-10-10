#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Creates a D2D1_SIZE_F structure that contains the specified width and height.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1helper/nf-d2d1helper-sizef
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class SizeF extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Float}
     */
    Width {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    Height {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
