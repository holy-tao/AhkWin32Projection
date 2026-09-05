#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identify which components of each pixel of a render target are writable during blending. (D3D10_COLOR_WRITE_ENABLE)
 * @remarks
 * These flags can be combined with a bitwise OR.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_color_write_enable
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
class D3D10_COLOR_WRITE_ENABLE extends Win32Enum {

    /**
     * Allow data to be stored in the red component.
     * Native name: D3D10_COLOR_WRITE_ENABLE_RED
     * @type {Integer (Int32)}
     */
    static RED => 1

    /**
     * Allow data to be stored in the green component.
     * Native name: D3D10_COLOR_WRITE_ENABLE_GREEN
     * @type {Integer (Int32)}
     */
    static GREEN => 2

    /**
     * Allow data to be stored in the blue component.
     * Native name: D3D10_COLOR_WRITE_ENABLE_BLUE
     * @type {Integer (Int32)}
     */
    static BLUE => 4

    /**
     * Allow data to be stored in the alpha component.
     * Native name: D3D10_COLOR_WRITE_ENABLE_ALPHA
     * @type {Integer (Int32)}
     */
    static ALPHA => 8

    /**
     * Allow data to be stored in all components.
     * Native name: D3D10_COLOR_WRITE_ENABLE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 15
}
