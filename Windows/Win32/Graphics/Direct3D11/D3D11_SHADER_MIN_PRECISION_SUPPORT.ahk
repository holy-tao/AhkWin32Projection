#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that specify minimum precision levels at shader stages.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ne-d3d11-d3d11_shader_min_precision_support
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_SHADER_MIN_PRECISION_SUPPORT extends Win32Enum {

    /**
     * Minimum precision level is 10-bit.
     * Native name: D3D11_SHADER_MIN_PRECISION_10_BIT
     * @type {Integer (Int32)}
     */
    static 10_BIT => 1

    /**
     * Minimum precision level is 16-bit.
     * Native name: D3D11_SHADER_MIN_PRECISION_16_BIT
     * @type {Integer (Int32)}
     */
    static 16_BIT => 2
}
