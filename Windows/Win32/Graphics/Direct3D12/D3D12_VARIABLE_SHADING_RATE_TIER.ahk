#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a shading rate tier (for variable-rate shading, or VRS).
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_variable_shading_rate_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_VARIABLE_SHADING_RATE_TIER{

    /**
     * Specifies that variable-rate shading is not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VARIABLE_SHADING_RATE_TIER_NOT_SUPPORTED => 0

    /**
     * Specifies that variable-rate shading tier 1 is supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VARIABLE_SHADING_RATE_TIER_1 => 1

    /**
     * Specifies that variable-rate shading tier 2 is supported.
     * @type {Integer (Int32)}
     */
    static D3D12_VARIABLE_SHADING_RATE_TIER_2 => 2
}
