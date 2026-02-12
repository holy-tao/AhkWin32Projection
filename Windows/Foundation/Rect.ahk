#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Contains number values that represent the location and size of a rectangle.
 * @remarks
 * When applied to properties that represent UI information, the width and height values of a Rect value represent device-independent pixels. The *x* and *y* values have an indeterminate frame of reference (it depends on how this value is applied) but they often represent a point in the coordinate space of the main app window.
 * 
 * > **JavaScript:**
 * > In JavaScript, a Rect is an object with four data members: **x**, **y**, **width**, **height**. Other than the data members (fields), the API listed in the Rect members lists don't apply to JavaScript programming.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.rect
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class Rect extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The x-coordinate of the upper-left corner of the rectangle.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The y-coordinate of the upper-left corner of the rectangle.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * The width of the rectangle, in pixels.
     * @type {Float}
     */
    Width {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * The height of the rectangle, in pixels.
     * @type {Float}
     */
    Height {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
