#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TRIVERTEX structure contains color information and position information.
 * @remarks
 * 
 * In the <b>TRIVERTEX</b> structure, x and y indicate position in the same manner as in the <a href="https://docs.microsoft.com/previous-versions/dd162807(v=vs.85)">POINTL</a> structure contained in the wtypes.h header file. <b>Red</b>, <b>Green</b>, <b>Blue</b>, and <b>Alpha</b> members indicate color information at the point x, y. The color information of each channel is specified as a value from 0x0000 to 0xff00. This allows higher color resolution for an object that has been split into small triangles for display. The <b>TRIVERTEX</b> structure contains information needed by the <i>pVertex</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-gradientfill">GradientFill</a>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-trivertex
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class TRIVERTEX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The x-coordinate, in logical units, of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The y-coordinate, in logical units, of the upper-left corner of the rectangle.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The color information at the point of x, y.
     * @type {Integer}
     */
    Red {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The color information at the point of x, y.
     * @type {Integer}
     */
    Green {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The color information at the point of x, y.
     * @type {Integer}
     */
    Blue {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The color information at the point of x, y.
     * @type {Integer}
     */
    Alpha {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
