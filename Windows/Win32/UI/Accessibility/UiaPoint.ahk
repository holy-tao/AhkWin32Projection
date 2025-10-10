#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the coordinates of a point.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ns-uiautomationcore-uiapoint
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class UiaPoint extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>double</b>
     * 
     * The horizontal screen coordinate.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Type: <b>double</b>
     * 
     * The vertical screen coordinate.
     * @type {Float}
     */
    y {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
