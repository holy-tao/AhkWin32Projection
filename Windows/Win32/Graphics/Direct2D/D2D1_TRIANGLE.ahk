#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Contains the three vertices that describe a triangle.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_triangle
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_TRIANGLE {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The first vertex of a triangle.
     */
    point1 : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The second vertex of a triangle.
     */
    point2 : D2D_POINT_2F

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/Direct2D/d2d1-point-2f">D2D1_POINT_2F</a></b>
     * 
     * The third vertex of a triangle.
     */
    point3 : D2D_POINT_2F

}
