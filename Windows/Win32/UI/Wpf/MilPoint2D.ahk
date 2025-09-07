#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents an x- and y-coordinate pair in two-dimensional space.M
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milpoint2d
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class MilPoint2D extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The x-coordinate value of the point.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The y-coordinate value of the point.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
