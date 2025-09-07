#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies which components of each pixel of a render target are writable during blending.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc">D3D12_RENDER_TARGET_BLEND_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_color_write_enable
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COLOR_WRITE_ENABLE{

    /**
     * Allow data to be stored in the red component.
     * @type {Integer (Int32)}
     */
    static D3D12_COLOR_WRITE_ENABLE_RED => 1

    /**
     * Allow data to be stored in the green component.
     * @type {Integer (Int32)}
     */
    static D3D12_COLOR_WRITE_ENABLE_GREEN => 2

    /**
     * Allow data to be stored in the blue component.
     * @type {Integer (Int32)}
     */
    static D3D12_COLOR_WRITE_ENABLE_BLUE => 4

    /**
     * Allow data to be stored in the alpha component.
     * @type {Integer (Int32)}
     */
    static D3D12_COLOR_WRITE_ENABLE_ALPHA => 8

    /**
     * Allow data to be stored in all components.
     * @type {Integer (Int32)}
     */
    static D3D12_COLOR_WRITE_ENABLE_ALL => 15
}
