#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk
#Include Common\D2D_SIZE_F.ahk

/**
 * Describes an elliptical arc between two points.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1/ns-d2d1-d2d1_arc_segment
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_ARC_SEGMENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the arc.
     * @type {D2D_POINT_2F}
     */
    point{
        get {
            if(!this.HasProp("__point"))
                this.__point := D2D_POINT_2F(0, this)
            return this.__point
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-size-f">D2D1_SIZE_F</a></b>
     * 
     * The x-radius and y-radius of the arc.
     * @type {D2D_SIZE_F}
     */
    size{
        get {
            if(!this.HasProp("__size"))
                this.__size := D2D_SIZE_F(8, this)
            return this.__size
        }
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that specifies how many degrees in the clockwise direction the ellipse is rotated relative to the current coordinate system.
     * @type {Float}
     */
    rotationAngle {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_sweep_direction">D2D1_SWEEP_DIRECTION</a></b>
     * 
     * A value that specifies whether the arc sweep is clockwise or counterclockwise.
     * @type {Integer}
     */
    sweepDirection {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_arc_size">D2D1_ARC_SIZE</a></b>
     * 
     * A value that specifies whether the given arc is larger than 180 degrees.
     * @type {Integer}
     */
    arcSize {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
