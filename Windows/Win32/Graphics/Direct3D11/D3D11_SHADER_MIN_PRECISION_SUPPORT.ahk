#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Values that specify minimum precision levels at shader stages.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shader_min_precision_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_SHADER_MIN_PRECISION_SUPPORT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Minimum precision level is 10-bit.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_MIN_PRECISION_10_BIT => 1

    /**
     * Minimum precision level is 16-bit.
     * @type {Integer (Int32)}
     */
    static D3D11_SHADER_MIN_PRECISION_16_BIT => 2
}
