#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the blend operation on two color sources.
 * @remarks
 * 
 * This enumeration has the same numeric values as <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_blend_op">D3D10_BLEND_OP</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ne-d2d1effectauthor-d2d1_blend_operation
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_BLEND_OPERATION{

    /**
     * Add source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_OPERATION_ADD => 1

    /**
     * Subtract source 1 from source 2.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_OPERATION_SUBTRACT => 2

    /**
     * Subtract source 2 from source 1.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_OPERATION_REV_SUBTRACT => 3

    /**
     * Find the minimum of source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_OPERATION_MIN => 4

    /**
     * Find the maximum of source 1 and source 2.
     * @type {Integer (Int32)}
     */
    static D2D1_BLEND_OPERATION_MAX => 5
}
