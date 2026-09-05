#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a level of support for WaveMMA (wave_matrix) operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_wave_mma_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_WAVE_MMA_TIER extends Win32Enum {

    /**
     * Specifies that WaveMMA (wave_matrix) operations are not supported.
     * Native name: D3D12_WAVE_MMA_TIER_NOT_SUPPORTED
     * @type {Integer (Int32)}
     */
    static NOT_SUPPORTED => 0

    /**
     * Specifies that WaveMMA (wave_matrix) operations are supported.
     * Native name: D3D12_WAVE_MMA_TIER_1_0
     * @type {Integer (Int32)}
     */
    static 1_0 => 10
}
