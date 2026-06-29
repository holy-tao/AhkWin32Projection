#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an ordered pair of integers, typically the width and height of a rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/dcommon/ns-dcommon-d2d_size_u
 * @namespace Windows.Win32.Graphics.Direct2D.Common
 */
export default struct D2D_SIZE_U {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     * 
     * The horizontal component of this size.
     */
    width : UInt32

    /**
     * Type: <b>UINT32</b>
     * 
     * The vertical component of this size.
     */
    height : UInt32

}
