#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the position and size of a rectangle, in screen coordinates.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ns-uiautomationcore-uiarect
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaRect extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>double</b>
     * 
     * Position of the left side.
     * @type {Float}
     */
    left {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>double</b>
     * 
     * Position of the top side.
     * @type {Float}
     */
    top {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * Type: <b>double</b>
     * 
     * Width.
     * @type {Float}
     */
    width {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * Type: <b>double</b>
     * 
     * Height.
     * @type {Float}
     */
    height {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
