#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The POINTL structure defines the x- and y-coordinates of a point.
 * @remarks
 * The POINTL structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-point">POINT</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/windef/ns-windef-pointl
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class POINTL extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the <i>x</i>-coordinate of the point.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specifies the <i>y</i>-coordinate of the point.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Many Win32 APIs take points as 64-bit integer value types.
     * This will return the POINT in a compatible format
     */
    Value => NumGet(this, "uint64")
    
    ToString() {
        return Format("({1}, {2})", this.x, this.y)
    }
}
