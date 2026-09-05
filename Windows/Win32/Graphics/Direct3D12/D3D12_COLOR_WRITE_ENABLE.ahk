#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies which components of each pixel of a render target are writable during blending.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc">D3D12_RENDER_TARGET_BLEND_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_color_write_enable
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_COLOR_WRITE_ENABLE extends Win32Enum {

    /**
     * Allow data to be stored in the red component.
     * Native name: D3D12_COLOR_WRITE_ENABLE_RED
     * @type {Integer (Int32)}
     */
    static RED => 1

    /**
     * Allow data to be stored in the green component.
     * Native name: D3D12_COLOR_WRITE_ENABLE_GREEN
     * @type {Integer (Int32)}
     */
    static GREEN => 2

    /**
     * Allow data to be stored in the blue component.
     * Native name: D3D12_COLOR_WRITE_ENABLE_BLUE
     * @type {Integer (Int32)}
     */
    static BLUE => 4

    /**
     * Allow data to be stored in the alpha component.
     * Native name: D3D12_COLOR_WRITE_ENABLE_ALPHA
     * @type {Integer (Int32)}
     */
    static ALPHA => 8

    /**
     * Allow data to be stored in all components.
     * Native name: D3D12_COLOR_WRITE_ENABLE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 15
}
