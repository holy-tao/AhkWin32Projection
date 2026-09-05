#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies if the hardware and driver support conservative rasterization and at what tier level.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_conservative_rasterization_tier
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_CONSERVATIVE_RASTERIZATION_TIER extends Win32Enum {

    /**
     * Conservative rasterization isn't supported.
     * Native name: D3D11_CONSERVATIVE_RASTERIZATION_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * Tier_1 conservative rasterization is supported.
     * Native name: D3D11_CONSERVATIVE_RASTERIZATION_TIER_1
     * @type {Integer (Int32)}
     */
    static 1 => 1

    /**
     * Tier_2 conservative rasterization is supported.
     * Native name: D3D11_CONSERVATIVE_RASTERIZATION_TIER_2
     * @type {Integer (Int32)}
     */
    static 2 => 2

    /**
     * Tier_3 conservative rasterization is supported.
     * Native name: D3D11_CONSERVATIVE_RASTERIZATION_TIER_3
     * @type {Integer (Int32)}
     */
    static 3 => 3
}
