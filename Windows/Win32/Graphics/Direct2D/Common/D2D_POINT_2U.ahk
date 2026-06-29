#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an x-coordinate and y-coordinate pair, expressed as an unsigned 32-bit integer value, in two-dimensional space.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_point_2u
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_POINT_2U {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The x-coordinate value of the point.
     */
    x : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The y-coordinate value of the point.
     */
    y : UInt32

}
