#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines a rectangle.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3drect
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DRECT {
    #StructPack 4

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The x-coordinate of the upper-left corner of the rectangle.
     */
    x1 : Int32

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The y-coordinate of the upper-left corner of the rectangle.
     */
    y1 : Int32

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The x-coordinate of the lower-right corner of the rectangle.
     */
    x2 : Int32

    /**
     * Type: **[**LONG**](../winprog/windows-data-types.md)**
     * 
     * 
     * The y-coordinate of the lower-right corner of the rectangle.
     */
    y2 : Int32

}
