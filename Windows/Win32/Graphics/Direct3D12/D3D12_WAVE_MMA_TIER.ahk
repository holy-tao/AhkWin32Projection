#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify a level of support for WaveMMA (wave_matrix) operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_wave_mma_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_WAVE_MMA_TIER{

    /**
     * Specifies that WaveMMA (wave_matrix) operations are not supported.
     * @type {Integer (Int32)}
     */
    static D3D12_WAVE_MMA_TIER_NOT_SUPPORTED => 0

    /**
     * Specifies that WaveMMA (wave_matrix) operations are supported.
     * @type {Integer (Int32)}
     */
    static D3D12_WAVE_MMA_TIER_1_0 => 10
}
