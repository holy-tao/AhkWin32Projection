#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Size class encapsulates a Width and Height dimension in a 2-D coordinate system.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/nl-gdiplustypes-size
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Size extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
