#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PointF class encapsulates a point in a 2-D coordinate system.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplustypes/nl-gdiplustypes-pointf
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class PointF extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * @type {Float}
     */
    Y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
