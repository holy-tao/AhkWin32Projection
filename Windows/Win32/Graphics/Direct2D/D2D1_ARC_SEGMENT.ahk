#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_SIZE_F.ahk" { D2D_SIZE_F }
#Import ".\D2D1_ARC_SIZE.ahk" { D2D1_ARC_SIZE }
#Import ".\D2D1_SWEEP_DIRECTION.ahk" { D2D1_SWEEP_DIRECTION }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Describes an elliptical arc between two points.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_arc_segment
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_ARC_SEGMENT {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The end point of the arc.
     */
    point : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-size-f">D2D1_SIZE_F</a></b>
     * 
     * The x-radius and y-radius of the arc.
     */
    size : D2D_SIZE_F

    /**
     * Type: <b>FLOAT</b>
     * 
     * A value that specifies how many degrees in the clockwise direction the ellipse is rotated relative to the current coordinate system.
     */
    rotationAngle : Float32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_sweep_direction">D2D1_SWEEP_DIRECTION</a></b>
     * 
     * A value that specifies whether the arc sweep is clockwise or counterclockwise.
     */
    sweepDirection : D2D1_SWEEP_DIRECTION

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_arc_size">D2D1_ARC_SIZE</a></b>
     * 
     * A value that specifies whether the given arc is larger than 180 degrees.
     */
    arcSize : D2D1_ARC_SIZE

}
