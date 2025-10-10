#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies if the hardware and driver support conservative rasterization and at what tier level.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_conservative_rasterization_tier
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CONSERVATIVE_RASTERIZATION_TIER{

    /**
     * Conservative rasterization isn't supported.
     * @type {Integer (Int32)}
     */
    static D3D11_CONSERVATIVE_RASTERIZATION_NOT_SUPPORTED => 0

    /**
     * Tier_1 conservative rasterization is supported.
     * @type {Integer (Int32)}
     */
    static D3D11_CONSERVATIVE_RASTERIZATION_TIER_1 => 1

    /**
     * Tier_2 conservative rasterization is supported.
     * @type {Integer (Int32)}
     */
    static D3D11_CONSERVATIVE_RASTERIZATION_TIER_2 => 2

    /**
     * Tier_3 conservative rasterization is supported.
     * @type {Integer (Int32)}
     */
    static D3D11_CONSERVATIVE_RASTERIZATION_TIER_3 => 3
}
