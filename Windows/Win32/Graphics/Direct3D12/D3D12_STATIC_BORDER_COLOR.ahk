#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the border color for a static sampler.
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_static_sampler_desc">D3D12_STATIC_SAMPLER_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_static_border_color
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STATIC_BORDER_COLOR extends Win32Enum {

    /**
     * Indicates black, with the alpha component as fully transparent.
     * Native name: D3D12_STATIC_BORDER_COLOR_TRANSPARENT_BLACK
     * @type {Integer (Int32)}
     */
    static TRANSPARENT_BLACK => 0

    /**
     * Indicates black, with the alpha component as fully opaque.
     * Native name: D3D12_STATIC_BORDER_COLOR_OPAQUE_BLACK
     * @type {Integer (Int32)}
     */
    static OPAQUE_BLACK => 1

    /**
     * Indicates white, with the alpha component as fully opaque.
     * Native name: D3D12_STATIC_BORDER_COLOR_OPAQUE_WHITE
     * @type {Integer (Int32)}
     */
    static OPAQUE_WHITE => 2

    /**
     * Native name: D3D12_STATIC_BORDER_COLOR_OPAQUE_BLACK_UINT
     * @type {Integer (Int32)}
     */
    static OPAQUE_BLACK_UINT => 3

    /**
     * Native name: D3D12_STATIC_BORDER_COLOR_OPAQUE_WHITE_UINT
     * @type {Integer (Int32)}
     */
    static OPAQUE_WHITE_UINT => 4
}
