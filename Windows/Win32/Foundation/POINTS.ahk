#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * The POINTS structure defines the x- and y-coordinates of a point.
 * @remarks
 * 
 * The POINTS structure is similar to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-point">POINT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structures. The difference is that the members of the POINTS structure are of type SHORT, while those of the other two structures are of type LONG.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//windef/ns-windef-points
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class POINTS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Specifies the <i>x</i>-coordinate of the point.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "short")
        set => NumPut("short", value, this, 0)
    }

    /**
     * Specifies the <i>y</i>-coordinate of the point.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 2, "short")
        set => NumPut("short", value, this, 2)
    }
}
