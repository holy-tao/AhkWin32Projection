#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "Common\D2D_RECT_F.ahk" { D2D_RECT_F }

/**
 * Contains the dimensions and corner radii of a rounded rectangle.
 * @remarks
 * Each corner of the rectangle specified by *rect* is replaced with a quarter ellipse, with a radius in each direction specified by *radiusX* and *radiusY*.
 * 
 * If *radiusX* is greater than or equal to half the width of the rectangle, and *radiusY* is greater than or equal to one-half the height, then the rounded rectangle is an ellipse with the same width and height of *rect*.
 * 
 * Even when both *radiusX* and *radiusY* are zero, the rounded rectangle is different from a rectangle. When stroked, the corners of the rounded rectangle are roundly joined, not mitered (square).
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ns-d2d1-d2d1_rounded_rect
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_ROUNDED_RECT {
    #StructPack 4

    /**
     * Type: **[D2D1_RECT_F](/windows/win32/Direct2D/d2d1-rect-f)**
     * 
     * The coordinates of the rectangle.
     */
    rect : D2D_RECT_F

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The x-radius for the quarter ellipse that is drawn to replace every corner of the rectangle.
     */
    radiusX : Float32

    /**
     * Type: **[FLOAT](/windows/win32/winprog/windows-data-types)**
     * 
     * The y-radius for the quarter ellipse that is drawn to replace every corner of the rectangle.
     */
    radiusY : Float32

}
