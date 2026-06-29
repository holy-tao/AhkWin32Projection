#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a rectangle defined by the upper-left corner pair of coordinates (left,top) and the lower-right corner pair of coordinates (right, bottom). These coordinates are expressed as a 32-bit integer values.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_rect_u
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_RECT_U {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     */
    left : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     */
    top : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     */
    right : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     */
    bottom : UInt32

}
