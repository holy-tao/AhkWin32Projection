#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the characteristics of a rounded corner, such as can be applied to a [Border](../windows.ui.xaml.controls/border.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.cornerradius
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class CornerRadius extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The radius of rounding, in pixels, of the upper-left corner of the object where a CornerRadius is applied.
     * @type {Float}
     */
    TopLeft {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The radius of rounding, in pixels, of the upper-right corner of the object where a CornerRadius is applied.
     * @type {Float}
     */
    TopRight {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The radius of rounding, in pixels, of the lower-right corner of the object where a CornerRadius is applied.
     * @type {Float}
     */
    BottomRight {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The radius of rounding, in pixels, of the lower-left corner of the object where a CornerRadius is applied.
     * @type {Float}
     */
    BottomLeft {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
