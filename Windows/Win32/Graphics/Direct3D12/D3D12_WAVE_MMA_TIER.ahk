#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify a level of support for WaveMMA (wave_matrix) operations.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_wave_mma_tier
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_WAVE_MMA_TIER {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
