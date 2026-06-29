#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Contains the center point, x-radius, and y-radius of an ellipse.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_ellipse
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_ELLIPSE {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The center point of the ellipse.
     */
    point : D2D_POINT_2F

    /**
     * Type: <b>FLOAT</b>
     * 
     * The X-radius of the ellipse.
     */
    radiusX : Float32

    /**
     * Type: <b>FLOAT</b>
     * 
     * The Y-radius of the ellipse.
     */
    radiusY : Float32

}
