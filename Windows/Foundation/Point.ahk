#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Represents x- and y-coordinate values that define a point in a two-dimensional plane.
 * @remarks
 * A Point value sometimes represents a coordinate space in the plane of the main window of an app, but there are other possible interpretations of Point values that can vary, depending on the property that uses the Point value.
 * 
 * > **JavaScript:**
 * > In JavaScript, a Point is an object with two data properties: **x** and **y**. Other than **x** and **y**, the remaining API listed here in the Point members lists (or shown in the table of contents) don't apply to JavaScript programming.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.point
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class Point extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The horizontal position of the point.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * The vertical position of the point.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
