#Requires AutoHotkey v2.0.0 64-bit

/**
 * Values that specify minimum precision levels at shader stages.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shader_min_precision_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_SHADER_MIN_PRECISION_SUPPORT{

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
