#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The POINTFLOAT structure contains the x and y coordinates of a point.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-pointfloat
 * @namespace Windows.Win32.Graphics.OpenGL
 * @version v4.0.30319
 */
class POINTFLOAT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the horizontal (x) coordinate of a point.
     * @type {Float}
     */
    x {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Specifies the vertical (y) coordinate of a point.
     * @type {Float}
     */
    y {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
