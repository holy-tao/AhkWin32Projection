#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The Point class encapsulates a point in a 2-D coordinate system.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/nl-gdiplustypes-point
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Point extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
