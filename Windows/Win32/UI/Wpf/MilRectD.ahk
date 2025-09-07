#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the width, height, and location of a rectangle.M
 * @see https://learn.microsoft.com/windows/win32/api/mileffects/ns-mileffects-milrectd
 * @namespace Windows.Win32.UI.Wpf
 * @version v4.0.30319
 */
class MilRectD extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's left side.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's top side.
     * @type {Float}
     */
    top {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's right side.
     * @type {Float}
     */
    right {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * Type: <b>DOUBLE</b>
     * 
     * The location of the rectangle's bottom side.
     * @type {Float}
     */
    bottom {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
