#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_LINE_RASTERIZATION_MODE extends Win32Enum {

    /**
     * Native name: D3D12_LINE_RASTERIZATION_MODE_ALIASED
     * @type {Integer (Int32)}
     */
    static ALIASED => 0

    /**
     * Native name: D3D12_LINE_RASTERIZATION_MODE_ALPHA_ANTIALIASED
     * @type {Integer (Int32)}
     */
    static ALPHA_ANTIALIASED => 1

    /**
     * Native name: D3D12_LINE_RASTERIZATION_MODE_QUADRILATERAL_WIDE
     * @type {Integer (Int32)}
     */
    static QUADRILATERAL_WIDE => 2

    /**
     * Native name: D3D12_LINE_RASTERIZATION_MODE_QUADRILATERAL_NARROW
     * @type {Integer (Int32)}
     */
    static QUADRILATERAL_NARROW => 3
}
