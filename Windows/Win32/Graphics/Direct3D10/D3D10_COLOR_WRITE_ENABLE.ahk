#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identify which components of each pixel of a render target are writable during blending. (D3D10_COLOR_WRITE_ENABLE)
 * @remarks
 * These flags can be combined with a bitwise OR.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_color_write_enable
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_COLOR_WRITE_ENABLE{

    /**
     * Allow data to be stored in the red component.
     * @type {Integer (Int32)}
     */
    static D3D10_COLOR_WRITE_ENABLE_RED => 1

    /**
     * Allow data to be stored in the green component.
     * @type {Integer (Int32)}
     */
    static D3D10_COLOR_WRITE_ENABLE_GREEN => 2

    /**
     * Allow data to be stored in the blue component.
     * @type {Integer (Int32)}
     */
    static D3D10_COLOR_WRITE_ENABLE_BLUE => 4

    /**
     * Allow data to be stored in the alpha component.
     * @type {Integer (Int32)}
     */
    static D3D10_COLOR_WRITE_ENABLE_ALPHA => 8

    /**
     * Allow data to be stored in all components.
     * @type {Integer (Int32)}
     */
    static D3D10_COLOR_WRITE_ENABLE_ALL => 15
}
